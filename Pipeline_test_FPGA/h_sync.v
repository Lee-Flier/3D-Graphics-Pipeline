

module h_sync(
		input 		clk,
		input		rst,
		output	reg	vsync_rst,
		output	reg	h_sync,
		output	reg	h_de,
		output		gate,
		output 	[9:0]	pixcel_col
);	  

	parameter	PULSE_LENGTH=96;
	parameter	BACK_PORCH=48;
	parameter	ACTIVE_VIDEO=640;
	parameter	FRONT_PORCH=16;
	
	reg	[9:0]	TOTAL_COUNT=PULSE_LENGTH+BACK_PORCH+ACTIVE_VIDEO+FRONT_PORCH; //800
	reg	[9:0]	BLANK_MIN=PULSE_LENGTH + BACK_PORCH; 
	reg	[9:0]	BLANK_MAX=PULSE_LENGTH+BACK_PORCH+ACTIVE_VIDEO;
		
	reg	[9:0]	count_i, ap_cnt;
	reg		ap_cnt_clr;
	
	assign	pixcel_col=ap_cnt;

//--------------------------------------------------------------------------//	

	//---define for state machine for h_sync signal---------------------------------
	parameter	IDLE		=	5'b00001,
				Sp	=	5'b00010,
				Bp	=	5'b00100,
				Ap	=	5'b01000,
				Fp	=	5'b10000;
	reg	[4:0]	cur_state;
	reg	[4:0]	nex_state; 

	
	always @(posedge clk) begin
		if(!rst) count_i<=0;
		else begin
			if(count_i!=TOTAL_COUNT-1)
				count_i<=count_i+1; 
			else count_i<=0; end
	end

	assign	gate=(count_i==TOTAL_COUNT-1) ? 1'b1 : 1'b0;
	assign	blank=(count_i<BLANK_MIN || count_i>=BLANK_MAX) ? 1'b1 : 1'b0;
	assign	sync_n=(count_i<PULSE_LENGTH) ? 1'b0 : 1'b1;
	
		
	always@(posedge clk)begin
		if(!rst)begin
			cur_state	<=	IDLE;
			vsync_rst	<= 	0;end
		else begin
			cur_state	<=	nex_state;
			vsync_rst 	<= 	1;end
	end				

	always@* begin
		case(cur_state)
			IDLE:begin
				ap_cnt_clr<=1;
				h_sync	<=1;
				h_de		<=0;					
				nex_state	<=	Sp;end			
			Sp:begin
				ap_cnt_clr<=1;
				h_sync	<=0;
				h_de		<=0;								
				if(sync_n)	nex_state	<=	Bp;
				else nex_state	<=	Sp;end
			Bp:begin
				ap_cnt_clr<=1;
				h_sync	<=1;
				h_de		<=0;								
				if(!blank)	nex_state	<=	Ap;
				else	nex_state	<=	Bp;end
			Ap:begin
				ap_cnt_clr<=0;
				h_sync	<=1;
				h_de		<=1;									
				if(blank) nex_state	<=	Fp;
				else	nex_state	<=	Ap;end			
			Fp:begin
				ap_cnt_clr<=1;
				h_sync	<=1;
				h_de		<=0;				
				if(gate)nex_state	<=	Sp;
				else	nex_state	<=	Fp;end
			default:begin
				ap_cnt_clr<=1;
				h_sync	<=0;
				h_de		<=0;	
				nex_state	<=	IDLE;end
		endcase
	end					
    
	always @(posedge clk)begin                                                  
		if(ap_cnt_clr)  ap_cnt<=0;                  
		else	ap_cnt<=ap_cnt+1;
	end

endmodule			

		