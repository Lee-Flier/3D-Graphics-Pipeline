
module tri_z_buffer(
		input	clk_i,
		input	reset_i,
		input	ras_en_i,
		output	pix_ready_o,
		input	pix_valid_i,
		input	[298:0]		pix_data_i,
		output	reg	valid_pix_o,
		input	ready_pix_i,
		output	reg	[298:0]		pix_data_o
	);
	
	wire	[298:0]		v0_dout;
	
	reg	v0_pop, v0_push;
	wire	v0_aemp, v0_emp;
	wire	v0_afull,	v0_full;
	wire	v0_valid, 	v0_wack;
	
	wire	[15:0]	new_z_value;
	reg	[15:0]	z0_value, z1_value, z2_value;
	
	reg	pix_req, pix_ack;
	
	reg	[15:0]	dina;
	reg	[16:0]	addra;
	wire	[16:0]	addrb;
	reg		wea;
	wire	[16:0]	addry_in, addry_out;
	//reg	wea_buffer;
	wire	[15:0]	old_z_value;
	
	reg	signed [20:0]		u_param, v_param;
	reg	[8:0]	tempx;
	reg	[7:0]	tempy;
	
	Z_buffer	inst_Z_buffer(
		.clka(clk_i),
		.dina(dina),//24
		.addra(addra),
		.wea(wea),
		.clkb(clk_i),
		.addrb(addrb),
		.doutb(old_z_value) //24
		);
	
	vertex_color_fifo	inst_z_buffer_fifo(
		.clk(clk_i),
		.din(pix_data_i),
		.rd_en(v0_pop),
		.srst(0),
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
	
	assign	pix_ready_o=!v0_afull;
	
	always @(posedge clk_i) begin
		if(reset_i) v0_push<=0;
		else if(pix_valid_i)
			v0_push<=1;
		else v0_push<=0;
	end
	
	always @* begin
		if(reset_i) pix_ack<=0;
		else if(pix_req&&!v0_emp)
			pix_ack<=1;
		else
			pix_ack<=0;
	end
	
	always @(posedge clk_i) begin
		if(reset_i)	v0_pop<=0;
		else if(pix_ack) 
			v0_pop<=1;
		else v0_pop<=0;
	end
	
	reg	[2:0]	state;

	always @(posedge clk_i) begin
		if(reset_i) begin
			pix_req<=0;
			valid_pix_o<=0;
			addra<=0;
			wea<=1;
			state<=3'b000; end
		else begin
			case(state) 
			3'b000: begin
				valid_pix_o<=0;
				if(addra==76799)
					state<=3'b001;
				else  begin
					addra<=addra+1;
					dina<=16'hffff;
					wea<=1; end end
			3'b001: begin	
				valid_pix_o<=0;
				if(!ras_en_i) begin					
					addra<=0;
					dina<=16'hffff;
					wea<=1;
					state<=3'b000;end
				else begin
					wea<=0;
					pix_req<=1;
					state<=3'b010;end end
			// 3'b010: begin	
				// wea<=0;
				// pix_req<=1;
				// valid_pix_o<=0;
				// state<=3'b010;end
			3'b010: begin
				wea<=0;
				valid_pix_o<=0;
				if(v0_valid) state<=3'b011;
				if(pix_ack) pix_req<=0; end
			3'b011: begin
				valid_pix_o<=0;
				tempx<=v0_dout[298:290];
				tempy<=v0_dout[289:282];
				z2_value<=v0_dout[281:266];
				z1_value<=v0_dout[201:186];
				z0_value<=v0_dout[121:106];
				u_param<=v0_dout[41:21];
				v_param<=v0_dout[20:0];
				state<=3'b100;end
			3'b100: begin
				wea<=0;
				state<=3'b101; end
			3'b101: begin			
				if(new_z_value<=old_z_value) begin
					if(ready_pix_i) begin
						pix_data_o<=v0_dout;
						valid_pix_o<=1;
						addra<=addrb;
						dina<=new_z_value;
						wea<=1; 
						state<=3'b001;end
					else state<=3'b101; end 
				else state<=3'b001; end
			default state<=3'b000;
			endcase
		end
	end
	
/* 	assign	addry_in=tempy*320;
	assign	addrb=tempx+addry_in;
	
	//assign	addrb={tempx, tempy};
	
	wire		signed  [16:0]	z10, z20;
	
	assign	z10=z1_value-z0_value;
	assign	z20=z2_value-z0_value;
	
	reg	signed	[37:0]	u_z10,  v_z20;
	
	always @* begin
		u_z10<=u_param*z10;
		v_z20<=v_param*z20;
	end
	
	assign	new_z_value=z0_value+u_z10[35:20]+v_z20[35:20];
	 */
	
	assign	addry_in=tempy*320;
	assign	addrb=tempx+addry_in;
	
	//assign	addrb={tempx, tempy};
	
	wire		signed  [16:0]	z10, z20;
	wire		signed	[37:0]	z0_value_reg;
	wire		signed 	[37:0]	new_z_value_reg;	
	reg		signed	[37:0]	u_z10,  v_z20;
	
	assign	z10=z1_value-z0_value;
	assign	z20=z2_value-z0_value;
	assign	z0_value_reg=z0_value<<20;	
	
	always @* begin
		u_z10<=u_param*z10;
		v_z20<=v_param*z20;
	end
	
	assign	new_z_value_reg=z0_value_reg+u_z10+v_z20;
	
	assign	new_z_value=new_z_value_reg[35:20];
	
	// reg	[1:0]	uv_z_inc;	
	// always @* begin
		// if(u_z10>=0)
			// if(v_z20>=0)
				// uv_z_inc<=0;
			// else	uv_z_inc<=1;
		// else
			// if(v_z20_inc>=0)
				// uv_z_inc<=1;
			// else	uv_z_inc<=2;
	// end
	
	endmodule
	
	