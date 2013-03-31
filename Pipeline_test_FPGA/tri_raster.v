
module tri_raster(
		input 	clk_i,
		input 	reset_i,
		output		pix_ready_o,
		input		pix_valid_i,
		input		[96:0]	v0_reg_i,
		input		[96:0]	v1_reg_i,
		input		[96:0]	v2_reg_i,
		input		[16:0] area_reg_i,
		output		reg	valid_pix_o,
		input		ready_pix_i,
		output		reg	[298:0] pix_data_o
	);
		

	wire	[96:0]	v0_dout, v1_dout, v2_dout;
		
	reg		v0_pop,v1_pop,v2_pop;
	reg 		v0_push,v1_push,v2_push;
	wire 	v0_aemp,v1_aemp,v2_aemp;
	wire 	v0_afull,v1_afull,v2_afull;
	wire 	v0_emp, v1_emp, v2_emp;
	wire 	v0_full,v1_full,v2_full;
	wire 	v0_valid,v1_valid,v2_valid;
	wire 	v0_wack,v1_wack,v2_wack;
	
	reg		[16:0]	area_din;
	reg 		area_pop ,area_push;
	wire		[16:0]	area_dout;
	wire		area_emp ,area_aemp ,area_full,area_afull ,area_valid,area_wack;	
	
	wire	 [20:0]	u_param, v_param;
		
		tri_raster_fifo	inst_raster_fifo_v0(
			.clk(clk_i),
			.din(v0_reg_i),
			.rd_en(v0_pop),
			.srst(reset_i),
			.wr_en(v0_push),
			//.almost_empty(v0_aemp),
			//.almost_full(v0_afull),
			.dout(v0_dout),
			.empty(v0_emp),
			.full(v0_full),
			.prog_empty(v0_aemp),
			.prog_full(v0_afull),
			.valid(v0_valid),
			.wr_ack(v0_wack)
		);		
		
		tri_raster_fifo	inst_raster_fifo_v1(
			.clk(clk_i),
			.din(v1_reg_i),
			.rd_en(v1_pop),
			.srst(reset_i),
			.wr_en(v1_push),
			//.almost_empty(v1_aemp),
			//.almost_full(v1_afull),
			.dout(v1_dout),
			.empty(v1_emp),
			.full(v1_full),
			.prog_empty(v1_aemp),
			.prog_full(v1_afull),
			.valid(v1_valid),
			.wr_ack(v1_wack)
		);		
		
		tri_raster_fifo	inst_raster_fifo_v2(
			.clk(clk_i),
			.din(v2_reg_i),
			.rd_en(v2_pop),
			.srst(reset_i),
			.wr_en(v2_push),
			//.almost_empty(v2_aemp),
			//.almost_full(v2_afull),
			.dout(v2_dout),
			.empty(v2_emp),
			.full(v2_full),
			.prog_empty(v2_aemp),
			.prog_full(v2_afull),
			.valid(v2_valid),
			.wr_ack(v2_wack)
		);		
		
		tri_area_fifo inst_tri_area_fifo (
			.clk(clk_i),
			.din(area_reg_i),
			.rd_en(area_pop),
			.srst(reset_i),
			.wr_en(area_push),
			//.almost_empty(area_aemp),
			//.almost_full(area_afull),
			.dout(area_dout),
			.empty(area_emp),
			.full(area_full ),
			.prog_empty(area_aemp),
			.prog_full(area_afull),
			.valid(area_valid),
			.wr_ack(area_wack)
		);
		
	wire 	sfifo_aemp;
	wire 	sfifo_emp;
	wire		sfifo_valid;
	wire		sfifo_afull;
	assign	sfifo_aemp =v0_aemp&&v1_aemp &&v2_aemp&&area_aemp ;
	assign	sfifo_emp =v0_emp&&v1_emp &&v2_emp&&area_emp ;
	assign 	sfifo_valid=v0_valid&&v1_valid&&v2_valid&&area_valid ;
	assign 	sfifo_afull=v0_afull &&v1_afull &&v2_afull&&area_afull ;
		
	assign	pix_ready_o=!sfifo_afull;
	
	
	always @(posedge clk_i) begin //push
		if(reset_i) begin
			area_push <=1'b0;
			v0_push	<=1'b0;
			v1_push	<=1'b0;		
			v2_push	<=1'b0;end 
		else if(pix_valid_i) begin
			area_push<=1'b1;
			v0_push<=1'b1;
			v1_push<=1'b1;
			v2_push<=1'b1;end
		else begin	
			area_push <=1'b0;
			v0_push	<=1'b0;
			v1_push	<=1'b0;		
			v2_push	<=1'b0;end 
	end
	
	reg	rastd_req, rastd_ack;
	always @(*)begin 
		if(reset_i) rastd_ack<=0;
		else if(rastd_req&&!sfifo_emp)
			rastd_ack<=1;
		else 
			rastd_ack<=0;
	end 
				
	always @(posedge clk_i) begin //pop
		if(reset_i)begin
			area_pop <=1'b0;
			v0_pop<=1'b0;
			v1_pop<=1'b0;
			v2_pop <=1'b0;end 
		else if(rastd_ack) begin
			area_pop<=1'b1;
			v0_pop<=1'b1;
			v1_pop<=1'b1;
			v2_pop <=1'b1;end 
		else begin 
			area_pop <=1'b0;
			v0_pop<=1'b0;
			v1_pop<=1'b0;
			v2_pop <=1'b0;end 
	end 
	
	reg	start;
	always @(posedge clk_i )begin 
		if(reset_i)	
			start<=0;
		else 
			start<=sfifo_valid;
	end 	

	reg  	signed	[9 :0]	dx0,dx1,dx2;
	reg  	signed	[8 :0] 	dy0,dy1,dy2;
	reg	signed 	[9:0] 	dtx0,dtx1,dtx2;
	reg	signed	[8:0]	 dty0,dty1,dty2;
	
	reg 	[8:0]	x0_tmp,x1_tmp,x2_tmp;
	reg 	[7:0]	y0_tmp,y1_tmp,y2_tmp; 
	
	reg	[8:0]	minx, maxx;
	reg	[7:0]	miny, maxy;
	
	reg	[8:0]	tempx;
	reg	[7:0]	tempy;
	
	reg 	signed [17:0]	tmpex00,tmpex01,tmpex10,tmpex11,tmpex20,tmpex21; 
	reg 	signed	[17:0]	ex0, ex1, ex2;
//----for reciprocal-----------------------------
	wire 	rfd;
	reg 		[16:0] area_lock;
	//reg		[16:0]	divisor;
	wire 	[19:0]	area_recip;
	reg 		[5:0]		cnt; //--for reciprocal delay;
//----for interpolation--------------------------
	wire		[29:0] 	a0;
	reg	 	[16:0]	pix_addr_d0;
	

//	assign 	ras_en=!gpu_afull&&!gpu_wafull;				
	
	always @(posedge clk_i) begin 
		if(reset_i)begin
			x0_tmp<=0;	x1_tmp<=0;	x2_tmp<=0;
			y0_tmp<=0;	y1_tmp<=0;	y2_tmp<=0;end 			
		else if(sfifo_valid)begin 
			x0_tmp<=v0_dout[96:88];	y0_tmp<=v0_dout[87:80];
			x1_tmp<=v1_dout[96:88];	y1_tmp<=v1_dout[87:80];
			x2_tmp<=v2_dout[96:88];	y2_tmp<=v2_dout[87:80];end 
	end 
	
//--------------------------------edge funtion----------------------------//	
	always@(posedge clk_i) begin   //  calculate the vertical line N
		if(reset_i )begin 
			dx0 	<=0;
			dy0	<=0;
			dx1 	<=0;
			dy1	<=0;
			dx2 	<=0;
			dy2	<=0;end 
		else if(start)begin 
			 dx0 <=-(y1_tmp-y0_tmp);   
             dy0 <=x1_tmp-x0_tmp;
	         dx1 <=-(y2_tmp-y1_tmp);   
		     dy1 <=x2_tmp-x1_tmp;
             dx2 <=-(y0_tmp-y2_tmp);
             dy2 <=x0_tmp-x2_tmp; end 
	end   
	
	always @* begin  //calculate the vector P1P0  P1P2 P0P2 
		if(reset_i)begin 
			dtx0<=0;
			dtx1<=0;	
			dtx2<=0;	
			dty0<=0;	
			dty1<=0;	
			dty2<=0;end 
		else begin
			dtx0<=tempx-x0_tmp;
			dtx1<=tempx-x1_tmp;
			dtx2<=tempx-x2_tmp;
			dty0<=tempy-y0_tmp;
			dty1<=tempy-y1_tmp;
			dty2<=tempy-y2_tmp;	end 
	end

	always @* begin  //dot product
		if(reset_i)begin 
			tmpex00<=0;
			tmpex01<=0;
			tmpex10<=0;
			tmpex11<=0;
			tmpex20<=0;
			tmpex21<=0;end
		else begin
			tmpex00<=dtx0*dx0;
			tmpex01<=dty0*dy0;
			tmpex10<=dtx1*dx1;
			tmpex11<=dty1*dy1;
			tmpex20<=dtx2*dx2;
			tmpex21<=dty2*dy2;end 
	end 

	// always@(posedge clk )begin 
		// if(reset_i )begin 
			// ex0 <=0;
			// ex1 <=0;
			// ex2 <=0;end 
		// else begin
				// ex0 <=tmpex00+tmpex01;
				// ex1 <=tmpex10+tmpex11;
				// ex2 <=tmpex20+tmpex21;end
	// end
//----------calculate the minx,maxx,maxy signal for rasterization-------------------	
	always @* begin   //----calculate the minx value of three vertice
		if(reset_i ) 		
			minx <=0;
		else if(start)begin 
			if(x0_tmp <=x1_tmp )begin 
				if(x0_tmp <=x2_tmp ) minx <=x0_tmp ; 
				else 	minx <=x2_tmp ; end 
			else begin 
				if(x1_tmp <=x2_tmp ) 	minx <=x1_tmp ;
				else	minx <=x2_tmp ; end end 
	end
	
	always @* begin   //---calculate the maxx value of three vertice....
		if(reset_i ) 		
			maxx <=0;
		else if(start)begin 
			if(x0_tmp >=x1_tmp )begin 
				if(x0_tmp >=x2_tmp ) 	maxx <=x0_tmp ; 
				else 	maxx <=x2_tmp ; end 
			else begin 
				if(x1_tmp >=x2_tmp )	maxx <=x1_tmp ;
				else	maxx <=x2_tmp; end end 
	end 
	
	always @* begin //---calculate the maxy value of three vertice....
		if(reset_i ) 		
			maxy <=0;
		else if(start)begin 
			if(y0_tmp >=y1_tmp )begin 
				if(y0_tmp >=y2_tmp )	maxy <=y0_tmp ; 
				else maxy <=y2_tmp ; end 
			else begin 
				if(y1_tmp >=y2_tmp ) maxy <=y1_tmp;
				else	maxy <=y2_tmp; end end 
	end 															 	

	always @* begin
		if(reset_i)
			miny<=0;
		else if(start) begin
			if(y0_tmp <=y1_tmp )begin 
				if(y0_tmp <=y2_tmp )	miny <=y0_tmp ; 
				else miny <=y2_tmp ; end 
			else begin 
				if(y1_tmp <=y2_tmp ) miny <=y1_tmp;
				else	miny <=y2_tmp; end end
	end 
	
	//----e0(x,y)=(x-x0)*(y2-y0)-(y-y0)*(x2-x0);
	//----e1(x,y)=(x-x1)*(y0-y1)-(y-y1)*(x0-x1);
	//----e2(x,y)=(x-x2)*(y1-y2)-(y-y2)*(x1-x2);
	

	reg [2:0] 	state;
//	reg [16:0]	gpu_addr_i,gpu_addr_clr;
	
	always @(posedge clk_i )begin   //......state machine....
		if(reset_i)begin 
			rastd_req<=0;
			valid_pix_o<=0;
			cnt<=0;
			tempx<=0;
			tempy<=0;
			state <=3'b000; end
		else begin
			case (state  )
			3'b000:begin 
				rastd_req<=1;
				valid_pix_o<=0;
				cnt		<=0;		
				tempx	<=0;
				tempy	<=0;
				state<=3'b001;end
			3'b001:begin 
				if(start) state <=3'b010;
				if(rastd_ack)	rastd_req<=0;end	// .ready. next triangle...			
			3'b010: begin 
				if(cnt==35)begin 
					cnt<=0;
					tempx<=minx;
					tempy<=miny;
					state <=3'b011;end 
				else begin 
					cnt <=cnt +1;end end 
			3'b011: begin
				ex0 <=tmpex00+tmpex01;
				ex1 <=tmpex10+tmpex11;
				ex2 <=tmpex20+tmpex21;
				state<=3'b100;end
			3'b100: begin
				state<=3'b101;end
			3'b101: begin
				if(ex0>=0 && ex1>=0 && ex2>=0) begin
					if(ready_pix_i) begin
						pix_data_o<={tempx, tempy, v2_dout[79:0], v1_dout[79:0], v0_dout[79:0], u_param, v_param};
						valid_pix_o<=1'b1;
						state<=3'b110;	end
					else	state<=3'b101;	end
/* 				else if(ex0==0 && (dx0>0||dy0>0))begin
						if(ready_pix_i) begin
							pix_data_o<={tempx, tempy, v2_dout[79:0], v1_dout[79:0], v0_dout[79:0], u_param, v_param};
							valid_pix_o<=1'b1;
							state<=3'b101;	end
						else	state<=3'b100;	end
				else if(ex1==0 && (dx1>0||dy1>0))begin
						if(ready_pix_i) begin
							pix_data_o<={tempx, tempy, v2_dout[79:0], v1_dout[79:0], v0_dout[79:0], u_param, v_param};
							valid_pix_o<=1'b1;
							state<=3'b101;	end
						else	state<=3'b100;	end
				else if(ex2==0 && (dx2>0 ||dy2>0))begin
						if(ready_pix_i) begin
							pix_data_o<={tempx, tempy, v2_dout[79:0], v1_dout[79:0], v0_dout[79:0], u_param, v_param};
							valid_pix_o<=1'b1;
							state<=3'b101;	end
						else	state<=3'b100;	end */
				else state<=3'b110;end
			3'b110: begin 
				valid_pix_o<=0;
				if(!(tempx==maxx && tempy ==maxy))begin 
						state<=3'b011;
						if(tempx ==maxx)begin 
							tempx <=minx;
							tempy <=tempy +1;end 
						else begin 
							tempx <=tempx +1;
							tempy <=tempy;end end			
				else begin 
					rastd_req<=1;
					state <=3'b001; end end
			default state<=3'b000;
			endcase 
		end 
	end 



	assign	u_param=ex2*area_recip;
	assign	v_param=ex0*area_recip;

	recip recip_inst (
		.clk(clk_i),
		.rfd(rfd),
		.dividend(2'd1), // Bus [1 : 0] 
		.divisor(area_dout), // Bus [16 : 0] 
		.quotient(), // Bus [1 : 0] 
		.fractional(area_recip)); // Bus [19 : 0] 	



endmodule 
