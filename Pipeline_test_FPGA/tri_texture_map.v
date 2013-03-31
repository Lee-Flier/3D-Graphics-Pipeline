module tri_texture_map(
		input	clk_i,
		input	reset_i,
		input	Ver_Tex_i,
		output	pix_ready_o,
		input	pix_valid_i,
		input	[56:0]		pix_data_i,
		output	reg	valid_pix_o,
		input	ready_pix_i,
		output	reg	[40:0]	pix_data_o
	);
	
	wire	[56:0]		v0_dout;
	
	reg	v0_pop, v0_push;
	wire	v0_aemp, v0_emp;
	wire	v0_afull,	v0_full;
	wire	v0_valid, 	v0_wack;
	
	reg	pix_req, pix_ack;
	
	reg	[23:0]	dina;
	reg	[11:0]	addra;
	//wire	[11:0]	addrby00;// addrby01, addrby10, addrby11;
	//wire	[11:0]	addrb00;// addrb01, addrb10, addrb11;
	wire	[11:0]	addrby;
	wire	[11:0]	addrb;
	wire	[23:0]	doutb;
	// reg	[23:0]	doutb00, doutb01, doutb10, doutb11;
	// reg	[23:0]	D00, D01, D10, D11;
	// wire	[23:0]	tex_RGB;
	// reg	[23:0]	tex_R, tex_G, tex_B;
	// wire	[23:0]	rgb24;
	// wire	[7:0]		RGB;
	// wire	[16:0]	para00, para01, para10, para11;
	reg	wea=0;
	
	//reg	[20:0]	u_param, v_param;
	reg	[8:0]		tempx;
	reg	[7:0]		tempy;
	reg	[7:0]	Tx, Ty;
	
	wire	[23:0]	rgb;
	
	// reg	[7:0]		rgb00, rgb01, rgb10, rgb11;
	// wire	[7:0]		red00, red01, red10, red11;
	// wire	[7:0]		green00, green01, green10, green11;
	// wire	[7:0]		blue00, blue01, blue10, blue11;
	
	// assign	red00=doutb00[23:16];
	// assign	red01=doutb00[23:16];
	// assign	red10=doutb00[23:16];
	// assign	red11=doutb00[23:16];
	
	// assign	green00=doutb00[15:8];
	// assign	green01=doutb00[15:8];
	// assign	green10=doutb00[15:8];
	// assign	green11=doutb00[15:8];
	
	// assign	blue00=doutb00[7:0];	
	// assign	blue01=doutb00[7:0];	
	// assign	blue10=doutb00[7:0];	
	// assign	blue11=doutb00[7:0];
	
	
	// assign	para00=(9'b100000000-Tx[7:0])*(9'b100000000-Ty[7:0]);
	// assign	para01=Tx[7:0]*(9'b100000000-Ty[7:0]);
	// assign	para10=(9'b100000000-Tx[7:0])*Ty[7:0];
	// assign	para11=Tx[7:0]*Ty[7:0];
	
	// always@(posedge clk_i) begin
		// D00=rgb00*para00;
		// D01=rgb01*para01;
		// D10=rgb10*para10;
		// D11=rgb11*para11;
	// end
	
	// assign	rgb24=D00+D01+D10+D11;
	// assign	RGB=rgb24[23:16];
	//assign	RGB=D00[23:16]+D01[23:16]+D10[23:16]+D11[23:16];
	// assign	tex_RGB=tex_R+tex_G+tex_B;
	//assign	tex_RGB=doutb11;
	
	
	Tex_buffer	inst_Tex_buffer(
		.clka(clk_i),
		.dina(dina),
		.addra(addra),
		.wea(wea),
		.clkb(clk_i),
		.addrb(addrb),
		.doutb(doutb) 
		);
	
	tri_texture_fifo	inst_tri_texture_fifo(
		.clk(clk_i),
		.din(pix_data_i),
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
	
	reg	[3:0]	state;	
	
	always @(posedge clk_i) begin
		if(reset_i) begin
			pix_req<=0;
			valid_pix_o<=0;
			state<=4'b0000; end
		else begin
			case(state) 
			4'b0000: begin
				pix_req<=1;
				valid_pix_o<=0;
				state<=4'b0010;end
			4'b0010: begin				
				valid_pix_o<=0;
				if(v0_valid) state<=4'b0011;
				if(pix_ack) pix_req<=0; end
			4'b0011: begin
				valid_pix_o<=0;
				tempx<=v0_dout[56:48];
				tempy<=v0_dout[47:40];
				Tx<=v0_dout[15:8];
				Ty<=v0_dout[7:0];
				state<=4'b0100;end
			// 4'b0100: begin
				// addrb<=addrb00;
				// state<=4'b0101;end
			// 4'b0101: begin
				// addrb<=addrb00;
				// state<=4'b0110;end
			4'b0100:begin
				state<=4'b0101;end
			//4'b0110: begin
				// addrb<=addrb00;
				// doutb00<=doutb;
				// state<=4'b0111;end
			// 4'b0111: begin
				// addrb<=addrb00;
				// doutb01<=doutb;
				// state<=4'b1000;end
			// 4'b1000: begin
				// doutb10<=doutb;
				// state<=4'b1001;end
			// 4'b1001: begin
				// doutb11<=doutb;
				// state<=4'b1010;end
			// 4'b1010: begin
				// rgb00<=red00;
				// rgb01<=red01;
				// rgb10<=red10;
				// rgb11<=red11;
				// state<=4'b1011;end
			// 4'b1011: begin
				// rgb00<=green00;
				// rgb01<=green01;
				// rgb10<=green10;
				// rgb11<=green11;				
				// state<=4'b1100;end
			// 4'b1100: begin
				// rgb00<=blue00;
				// rgb01<=blue01;
				// rgb10<=blue10;
				// rgb11<=blue11;
				// tex_R<=RGB<<16;				
				// state<=4'b1101;end
			// 4'b1101:begin				
				// tex_G<=RGB<<8;
				// state<=4'b1110;end		
			// 4'b1110:begin
				// tex_B<=RGB;
				// state<=4'b1111;end
			4'b0101: begin			
				if(ready_pix_i) begin
					pix_data_o<={v0_dout[56:40],rgb};
					valid_pix_o<=1;
					state<=4'b0000;end end
			default state<=4'b0000;
			endcase
		end
	end
	
	
	assign	rgb=Ver_Tex_i ? v0_dout[39:16] : doutb;
	
	// wire	signed	[8:0]	Tx10, Tx20, Ty10, Ty20;
	// assign	Tx10=Tx1-Tx0;
	// assign	Tx20=Tx2-Tx0;
	// assign	Ty10=Ty1-Ty0;
	// assign	Ty20=Ty2-Ty0;
	
	// reg	signed	[28:0]	u_Tx10, v_Tx20, u_Ty10, v_Ty20;
	// always @* begin
		// u_Tx10<=u_param*Tx10;
		// v_Tx20<=v_param*Tx20;
		// u_Ty10<=u_param*Ty10;
		// v_Ty20<=v_param*Ty20;
	// end
	
	// reg	[1:0]	uv_Tx_inc, uv_Ty_inc;
	// always @* begin
		// if(u_Tx10>0) uv_Tx_inc<=0;
		// else begin
			// if(u_Tx10[27:20]==0) begin
				// if(v_Tx20[27:20]==0)
					// uv_Tx_inc<=0;
				// else uv_Tx_inc<=1; end
			// else begin
				// if(v_Tx20[27:20]==0)
					// uv_Tx_inc<=1;
				// else uv_Tx_inc<=2; end
		// end
	// end
			
	// always @* begin
		// if(u_Ty10>0) uv_Ty_inc<=0;
		// else begin
			// if(u_Ty10[27:20]==0) begin
				// if(v_Ty20[27:20]==0)
					// uv_Ty_inc<=0;
				// else uv_Ty_inc<=1; end
			// else begin
				// if(v_Ty20[27:20]==0)
					// uv_Ty_inc<=1;
				// else uv_Ty_inc<=2; end
		// end
	// end
	
	
	// assign	Tx=Tx0+u_Tx10[27:20]+v_Tx20[27:20];//+uv_Tx_inc;
	// assign	Ty=Ty0+u_Ty10[27:20]+v_Ty20[27:20];//+uv_Ty_inc;

	assign	addrby=Ty*64;
	assign	addrb=Tx+addrby;
	// assign	addrby00=Ty[15:8]*64;
	// assign	addrb00=Tx[15:8]+addrby00;
	
	// assign	addrby01=Ty[15:8]*64;
	// assign	addrb01=Tx[15:8]+addrby01+1;
	
	// assign	addrby10=(Ty[15:8]+1)*64;
	// assign	addrb10=Tx[15:8]+addrby10;
	
	// assign	addrby11=(Ty[15:8]+1)*64;
	// assign	addrb11=Tx[15:8]+addrby11+1;
	
	endmodule
	