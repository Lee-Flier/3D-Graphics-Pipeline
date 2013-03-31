
module tri_vertex_color(
		input	clk_i,
		input	reset_i,
		output		pix_ready_o,
		input		pix_valid_i,
		input	[298:0]		pix_data_i,
		output		reg		valid_pix_o,
		input		ready_pix_i,
		output		reg	[56:0]	pix_data_o
	);
	
	wire	[298:0]		v0_dout;
	
	reg	v0_pop, v0_push;
	wire	v0_aemp, v0_emp;
	wire	v0_afull,	v0_full;
	wire	v0_valid, 	v0_wack;
	
	wire		[7:0]	red, green, blue;
	wire		[7:0]	Tx, Ty;
	reg		[20:0]	u_param, v_param;
	
	reg	[7:0]	r0, g0, b0;
	reg	[7:0]	r1, g1, b1;
	reg	[7:0]	r2, g2, b2;
	
	reg	[7:0]	Tx0, Ty0;
	reg	[7:0]	Tx1, Ty1;
	reg	[7:0]	Tx2, Ty2;
	
	reg	[8:0]	tempx;
	reg	[7:0]	tempy;
	
	reg	pix_req, pix_ack;
	
	vertex_color_fifo	inst_vertex_color_fifo(
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
	
	reg	[1:0]	state;
	
	always @(posedge clk_i) begin
		if(reset_i) begin
			pix_req<=0;
			valid_pix_o<=0;
			state<=2'b00;end
		else begin
			case(state) 
			2'b00: begin
				pix_req<=1;
				valid_pix_o<=0;
				state<=2'b01;end
			2'b01: begin
				valid_pix_o<=0;
				if(v0_valid) state<=2'b10;
				if(pix_ack)  pix_req<=0;end
			2'b10: begin
				valid_pix_o<=0;
				tempx<=v0_dout[298:290];
				tempy<=v0_dout[289:282];
				r2<=v0_dout[249:242];
				g2<=v0_dout[241:234];
				b2<=v0_dout[233:226];
				Tx2<=v0_dout[217:210];
				Ty2<=v0_dout[209:202];
				r1<=v0_dout[169:162];
				g1<=v0_dout[161:154];
				b1<=v0_dout[153:146];
				Tx1<=v0_dout[137:130];
				Ty1<=v0_dout[129:122];
				r0<=v0_dout[89:82];
				g0<=v0_dout[81:74];
				b0<=v0_dout[73:66];
				Tx0<=v0_dout[57:50];
				Ty0<=v0_dout[49:42];
				u_param<=v0_dout[41:21];
				v_param<=v0_dout[20:0];
				state<=2'b11;end
			2'b11: begin
				if(ready_pix_i) begin
					pix_data_o<={tempx, tempy, red, green, blue, Tx, Ty};
					valid_pix_o<=1;
					state<=2'b00;end
				else begin
					valid_pix_o<=0;
					state<=2'b11; end end
			endcase
		end
	end
				
	wire	signed	[8:0]	red10, green10, blue10, red20, green20, blue20;
	wire	signed [28:0] 	r0_reg, g0_reg, b0_reg;
	wire	signed [28:0] 	red_reg, green_reg, blue_reg;
	
	wire signed [8:0]		Tx10, Tx20, Ty10, Ty20;
	wire	signed [28:0]	Tx0_reg, Ty0_reg;
	wire signed [28:0]	Tx_reg, Ty_reg;
	
	assign	red10=r1-r0;
	assign	green10=g1-g0;
	assign	blue10=b1-b0;
	
	assign	red20=r2-r0;
	assign	green20=g2-g0;
	assign	blue20=b2-b0;
	
	assign	r0_reg=r0<<20;
	assign	g0_reg=g0<<20;
	assign	b0_reg=b0<<20;
	
	assign	Tx10=Tx1-Tx0;
	assign	Tx20=Tx2-Tx0;
	assign	Ty10=Ty1-Ty0;
	assign	Ty20=Ty2-Ty0;
	
	assign	Tx0_reg=Tx0<<20;
	assign	Ty0_reg=Ty0<<20;
	
	reg	signed	[28:0]	u_red10, v_red20, u_green10, v_green20, u_blue10, v_blue20;
	reg	signed [28:0]	u_Tx10, v_Tx20, u_Ty10, v_Ty20;
	
	always @* begin
		u_red10<=u_param*red10;
		v_red20<=v_param*red20;
		u_green10<=u_param*green10;
		v_green20<=v_param*green20;
		u_blue10<=u_param*blue10;
		v_blue20<=v_param*blue20;
		u_Tx10<=u_param*Tx10;
		v_Tx20<=v_param*Tx20;
		u_Ty10<=u_param*Ty10;
		v_Ty20<=v_param*Ty20;
	end
	
	// reg	[1:0]	uv_red_inc;
	// reg	[1:0]	uv_green_inc;
	// reg	[1:0]	uv_blue_inc;
	
	// always @* begin
		// if(u_red10[27:20]==0)
			// if(v_red20[27:20]==0)
				// uv_red_inc<=0;
			// else uv_red_inc<=1;
		// else 
			// if(v_red20[27:20]==0)
				// uv_red_inc<=1;
			// else uv_red_inc<=2;
	// end
	
	// always @* begin
		// if(u_green10[27:20]==0)
			// if(v_green20[27:20]==0)
				// uv_green_inc<=0;
			// else uv_green_inc<=1;
		// else 
			// if(v_green20[27:20]==0)
				// uv_green_inc<=1;
			// else uv_green_inc<=2;
	// end
	
	// always @* begin
		// if(u_blue10[27:20]==0)
			// if(v_blue20[27:20]==0)
				// uv_blue_inc<=0;
			// else uv_blue_inc<=1;
		// else 
			// if(v_blue20[27:20]==0)
				// uv_blue_inc<=1;
			// else uv_blue_inc<=2;
	// end
	
	assign	red_reg=r0_reg+u_red10+v_red20;
	assign	green_reg=g0_reg+u_green10+v_green20;
	assign	blue_reg=b0_reg+u_blue10+v_blue20;
	assign	Tx_reg=Tx0_reg+u_Tx10+v_Tx20;
	assign	Ty_reg=Ty0_reg+u_Ty10+v_Ty20;
	
	assign	red=red_reg[27:20];
	assign	green=green_reg[27:20];
	assign	blue=blue_reg[27:20];
	
	assign	Tx=Tx_reg[27:20];
	assign	Ty=Ty_reg[27:20];

	
	endmodule
	
		
	
	
	
	
	
	