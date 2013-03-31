`timescale 1ns / 1ps
module raster_sys(
	input		sys_clk_pin,
	output 	clk,
	// input		vga_clk,
	input 		nrst_done,
	input		Ver_Tex,
	input		Clc_scr,
	input		pix_valid,
	output		pix_ready,
	input		[96:0]	pix_data,
	input		[35:0]	background,
	input		enable,
	output		eof,
//----------iic for dvi------------
    output			sda_pin,
    output			scl_pin,
    output			done,
//----------port of dvi out -----------
	// input   		dvi_reset_b,
	output	[11:0]	dvi_d,
    output			dvi_h,
    output			dvi_v,
    output			dvi_de,
    output			dvi_xclk_n,
    output			dvi_xclk_p
	);

	reg	[8:0]		x0_tmp;
	reg 	[7:0]		y0_tmp;	
	reg	[3:0]	eof_cnt=0;
	
	reg	[8:0] 	x0_l,x1_l,x2_l;
	reg	[7:0] 	y0_l,y1_l,y2_l;
//---------signal defined by bram contain vertexes------------------------
	reg  	set_valid;//---a valid signal indicate the valid of the setup---
	reg		[3:0]	sta_rv;
	reg 		wea;

	reg 		[96:0] 	v0_r,v1_r,v2_r;
	reg		[96:0]	v0_reg, v1_reg, v2_reg;
	reg		[96:0]	pix_data_v0, pix_data_v1, pix_data_v2;	
	reg 		ver_valid;
	reg 		[4:0]	addra;
	
	reg	[23:0]	dina_buf;
	reg	[16:0]	addra_buf=0;
	reg	[16:0]	addrb_buf;
	wire	[16:0]	addry_in, addry_out;
	reg	wea_buf;
	wire	[23:0]	doutb_buf;
	reg	state=0;
	reg	ras_en;
	
	wire	sys_eof;
	wire	eof_d, eof_dd, eof_ddd;
	reg	eof_d0, eof_d1, eof_d2, eof_d3, eof_d4;
	reg	eof_d5, eof_d6, eof_d7, eof_d8, eof_d9;
	reg	eof_d10, eof_d11, eof_d12, eof_d13, eof_d14;
	
	// reg	[23:0]	dina_buffer0, dina_buffer1;
	// reg	[16:0]	addra_buffer0=0, addrb0;
	// reg	[16:0]	addra_buffer1=0, addrb1;
	// reg	[16:0]	addrb;
	// wire	[16:0]	addry_in, addry_out;
	// reg	wea_buffer0, wea_buffer1;
	// wire	[23:0]	doutb0;
	// wire	[23:0]	doutb1;
	// reg	[1:0]	state=0;
	// reg	state_rgb=0;
	// reg	ras_en;
	
	wire		h_sync;
	wire		v_sync;
	wire 	h_de;
	wire		v_de;
	wire		dvi_de_tmp;		//--for mode one;
	    
    wire [7:0]	vga_in_b;
	wire	[7:0]	vga_in_g;
	wire	[7:0]	vga_in_r;
    wire			vga_hsync;
    wire [9:0]	pixcel_row;
    wire [9:0]	pixcel_col;
	
	wire	[11:0]	dvi_d_obuf;
	
	assign	dvi_de_tmp		=	h_de&v_de;
	assign	dvi_d				=	dvi_d_obuf;  
	
//---ordering the position of vertex by computing  "Cross Product"'---- 
	reg	signed	[9:0]	v1,v3;
	reg 	signed	[8:0] 	v2,v4 ;
	reg 	signed	[17:0]	m1,m2;
	
	reg 		[16:0]	area_reg;
	reg		[16:0]	area;

	
	wire	pix_ready_raster;
	reg	pix_valid_sys;
	wire	valid_pix_raster;
	reg	ready_pix_param=1;
	wire	[40:0]	pix_data_param;
	
	wire		[298:0]		pix_data_raster;
	wire		[298:0]		pix_data_zbuffer;
	wire		[56:0]		pix_data_vertex;
	wire		pix_ready_vertex;
	wire		valid_pix_vertex;
	wire		pix_ready_zbuffer;
	wire		valid_pix_zbuffer;
	wire		pix_ready_texture;
	wire		valid_pix_texture;

//----------signal defined for vga_ctrl module;------------
	// wire 	iic_done;
	// wire 	nrst;
	// wire		nrst_done;
	// wire 	vga_eof ;
	// wire 	sys_clk_lock;
// //--------clear the screen and fill the frame buffer with backgroud color "36'hfffffffff'--
	// assign nrst	=sys_rst_pin ;
	// assign nrst_done=nrst &&sys_clk_lock;
	
	//assign	done=nrst_done;

	// wire 	clk;
	wire 	clk_100m;
	wire 	vga_clk;
	wire 	sys_clk;
	
	assign zbt_clk =clk_100m ;
	assign sys_clk =clk_100m ;
	assign clk	 =clk_100m;
	
	// sys_clk_gen sys_clk_inst (
	    // .CLKIN_IN(sys_clk_pin), 
	    // .RST_IN(0), 
	    // .CLKDV_OUT(vga_clk), 
	    // .CLKIN_IBUFG_OUT(), 
	    // .CLK0_OUT(clk_100m), 
	    // .LOCKED_OUT(sys_clk_lock)
	// );
	
	CLKDLL inst_CLKDLL(.CLKIN(sys_clk_pin), .RST(0), .CLKDV(vga_clk), .CLK0(clk_100m), .CLKFB(clk_100m),.LOCKED(sys_clk_lock));
	defparam inst_CLKDLL.CLKDV_DIVIDE = 4; //(1.5,2,2.5,3,4,5,8,16) 
	
	
	wire 	vga_eof;
	wire		eof_enable, vsync_enable;
	reg		vga_eof_meta, vga_eof_sync, vga_eof_sync_d;
//	wire		sys_eof;
	assign	vga_eof=eof_enable&vsync_enable;
	
	always @(posedge clk) begin
		if(!nrst_done) begin
			vga_eof_meta<=0;
			vga_eof_sync<=0;
			vga_eof_sync_d<=0;end
		else begin
			vga_eof_meta <= vga_eof; 
			vga_eof_sync <= vga_eof_meta; 
			vga_eof_sync_d <= vga_eof_sync; end
	end
	
	always @(posedge clk) begin
		eof_d0<=sys_eof;
		eof_d1<=eof_d0;
		eof_d2<=eof_d1;
		eof_d3<=eof_d2;
		eof_d4<=eof_d3;
		eof_d5<=eof_d4;
		eof_d6<=eof_d5;
		eof_d7<=eof_d6;
		eof_d8<=eof_d7;
		eof_d9<=eof_d8;
		eof_d10<=eof_d9;
		eof_d11<=eof_d10;
		eof_d12<=eof_d11;
		eof_d13<=eof_d12;
		eof_d14<=eof_d13;		
	end
	
	assign	eof_d=(sys_eof||eof_d0)||(eof_d1||eof_d2)||(eof_d3||eof_d4);
	assign	eof_dd=(eof_d5||eof_d6)||(eof_d7||eof_d8)||(eof_d9||eof_d10);
	assign	eof_ddd=(eof_d11||eof_d12)||(eof_d13||eof_d14);
	assign	eof=eof_d||eof_dd||eof_ddd;
	
	assign	sys_eof=vga_eof_sync&(!vga_eof_sync_d);
	
	always @(posedge clk) begin
		if(sys_eof) eof_cnt<=eof_cnt+1;
	end
	
	
	reg		v0_pop, v0_push;
	wire		v0_aemp, v0_afull;
	wire		v0_emp,  v0_full;
	wire		v0_valid, v0_wack;
	wire		[5:0]	v0_count;
	wire		[96:0]	dina;
	wire		[96:0]	douta;
	
	reg		rastd_req, rastd_ack;
	
	assign	dina=pix_data;
	
	tri_raster_fifo  inst_raster_fifo_v0(
		.clk(clk),
		.din(dina),
		.rd_en(v0_pop),
		.srst(!nrst_done),//0 reset
		.wr_en(v0_push),
		//.data_count(v0_count),
		//.almost_empty(v0_aemp),		
		//.almost_full(v0_afull),
		.prog_empty(v0_aemp),
		.prog_full(v0_afull),
		.dout(douta),
		.empty(v0_emp),
		.full(v0_full),
		.valid(v0_valid),
		.wr_ack(v0_wack)
	);	
	
	assign	pix_ready=!v0_afull;
	
	always @(posedge clk) begin
		if(!nrst_done) v0_push<=0;
		else if(pix_valid)
			v0_push<=1;
		else  v0_push<=0;
	end
	
	always @* begin
		if(!nrst_done) rastd_ack<=0;
		else if(rastd_req&&!v0_emp)
			rastd_ack<=1;
		else
			rastd_ack<=0;
	end
	
	always @(posedge clk) begin
		if(!nrst_done) v0_pop<=0;
		else if(rastd_ack)
			v0_pop<=1;
		else v0_pop<=0;
	end	

	
	always @(posedge clk )begin
		if(!nrst_done)begin
			sta_rv <=4'b0000;	end 				
		else if(pix_ready_raster)begin
			case (sta_rv )
			4'b0000:begin
				sta_rv <=4'b0001;
				rastd_req<=1;
				set_valid <=0;end
			4'b0001:begin
				set_valid <=0;
				if(rastd_ack) rastd_req<=0;
				if(v0_valid) begin
					v0_r <=douta;
					sta_rv <=4'b0010; end end
			4'b0010:begin
				set_valid <=0;
				rastd_req<=1;
				sta_rv <=4'b0011;end 					
			4'b0011:begin
				set_valid <=0;
				if(rastd_ack) rastd_req<=0;
				if(v0_valid) begin
					v1_r<=douta;
					sta_rv <=4'b0100; end  end
			4'b0100:begin
				set_valid <=0;
				rastd_req<=1;
				sta_rv<=4'b0101; end
			4'b0101: begin
				set_valid <=0;
				if(rastd_ack) rastd_req<=0;
				if(v0_valid) begin
					v2_r<=douta;
					sta_rv<=4'b0110; end end	
			4'b0110: begin
				set_valid<=1'b0;
				sta_rv<=4'b0111; end				
			4'b0111: begin
				set_valid<=1'b0;
				sta_rv<=4'b1000;end
			4'b1000: begin
				set_valid<=0;
				sta_rv<=4'b1001;end
			4'b1001: begin
				set_valid<=0;
				sta_rv<=4'b1010; end
			4'b1010: begin
				set_valid<=1;
				sta_rv<=4'b1011; end
			4'b1011: begin
				set_valid<=0;
				sta_rv<=4'b1100; end
			4'b1100: begin
				set_valid<=0;
				sta_rv<=4'b1101; end
			4'b1101: begin
				set_valid<=0;
				sta_rv<=4'b1110; end
			4'b1110: begin
				set_valid<=0;
				sta_rv<=4'b1111; end
			4'b1111: begin
				set_valid<=0;
				sta_rv<=4'b0000; end
			endcase 
		end 
	end 
	
	// //-----ram contained model's vertexes,three vectexes form a triangle----	
	// vertex_src inst_versrc (        
		// .clka(clk ),                    
		// .dina(dina), 	// Bus [58 : 0]    
		// .addra(addra), 	// Bus [4 : 0]   
		// .ena(1'b1),         
		// .wea(1'b0), 		// Bus [0 : 0]       
		// .douta(douta)); // Bus [58 : 0] 	
    
	always @(posedge clk) begin
		if(!nrst_done )begin 
			x0_l<=0;	x1_l<=0;	x2_l<=0;            
			y0_l<=0;	y1_l<=0;	y2_l<=0; end			
		else begin
			x0_l<=v0_r[96:88];	x1_l<=v1_r[96:88];	x2_l<=v2_r[96:88];            
			y0_l<=v0_r[87:80];	y1_l<=v1_r[87:80];	y2_l<=v2_r[87:80]; end 
	end    

	always @(posedge clk) begin  //Triangle setup...
		if(!nrst_done) begin
			v1<=0;	v2<=0; v3<=0;v4<=0;	
			y0_tmp<=0;	x0_tmp <=0;end
		else begin
			if(y0_l<=y1_l) begin
				if(y0_l<=y2_l) begin
					v1<=x1_l-x0_l;
					v2<=y1_l-y0_l;
					v3<=x2_l-x0_l;
					v4<=y2_l-y0_l;
					y0_tmp <=y0_l;
					x0_tmp <=x0_l;end 
				else begin
					v1<=x0_l-x2_l;
					v2<=y0_l-y2_l;
					v3<=x1_l-x2_l;
					v4<=y1_l-y2_l;				
					y0_tmp <=y2_l;
					x0_tmp <=x2_l;end end
			else begin
				if(y1_l<=y2_l) begin
					v1<=x2_l-x1_l;
					v2<=y2_l-y1_l;
					v3<=x0_l-x1_l;
					v4<=y0_l-y1_l;				
					y0_tmp <=y1_l;
					x0_tmp <=x1_l;end
				else  begin
					v1<=x0_l-x2_l;
					v2<=y0_l-y2_l;
					v3<=x1_l-x2_l;
					v4<=y1_l-y2_l;				
					y0_tmp <=y2_l;
					x0_tmp <=x2_l;end end
		end
	end

	always @(posedge clk) begin   //2*Area.... m1, m2..
		if(!nrst_done)begin 
			m1 <=0;
			m2 <=0;end 
		else begin 
		m1<=v1*v4 ;
		m2<=v2*v3;end 
	end 
	
	always@(posedge clk) begin //-----compute the area of the triangle for interpolation;	
		if(m1-m2 >0)
			area_reg  <=m1-m2;
		else 
			area_reg  <=m2-m1;
	end 

	always @(posedge clk )begin 
		if(!nrst_done)begin 
			v0_reg<=0;
			v1_reg<=0;
			v2_reg<=0;end 			 
		else begin //----when the submodule is busy for rasterization,the setup moduel can't changle the positon of vertexs.
		case({y0_tmp,x0_tmp} )//-----calculation the order of three points;
			{y0_l,x0_l}  :begin 
				v0_reg<=v0_r;
				if(m1-m2>0)begin 
					v1_reg<=v1_r;
					v2_reg<=v2_r;end
				else begin 
					v1_reg<=v2_r;
					v2_reg<=v1_r;end
			end
			{y1_l,x1_l } :begin 
				v0_reg<=v1_r;	
				if(m1-m2>0)begin 
					v1_reg<=v2_r;
					v2_reg<=v0_r;end 
				else begin 
					v1_reg<=v0_r;
					v2_reg<=v2_r;end 
			end
			{y2_l,x2_l } :begin 
				v0_reg<=v2_r;
				if(m1-m2>0)begin 
					v1_reg<=v0_r;
					v2_reg<=v1_r;end 
				else begin 
					v1_reg<=v1_r;
					v2_reg<=v0_r;end end
			  default :begin 
				v0_reg<=0;
				v1_reg<=0;
				v2_reg<=0;end			   					  			   						   				   			
			endcase end
	end			 
	
	always @(posedge clk) begin
		if(!nrst_done) begin
			pix_data_v0<=0;
			pix_data_v1<=0;
			pix_data_v2<=0;
			area<=0;
			pix_valid_sys<=1'b0;end
		else if(set_valid)begin
			pix_data_v0<= v0_reg;
			pix_data_v1<= v1_reg;
			pix_data_v2<= v2_reg;
			area<=area_reg;
			pix_valid_sys<=1'b1;end
		else begin
			pix_valid_sys<=1'b0;end
	end
	
	// always @(posedge clk )begin 
			// if(!nrst_done)begin
				// vga_eof_meta <= 0; 
				// vga_eof_sync <= 0; 
				// vga_eof_sync_d <=0;end 
			// else begin 
				// vga_eof_meta<=vga_eof;	
				// vga_eof_sync<=vga_eof_meta;
				// vga_eof_sync_d<=vga_eof_sync;end end 
				
	// assign 	sys_eof=vga_eof_sync&&~vga_eof_sync_d;
	
	//-----------------------------------------------------------------------
	// wire		ras_en;
	// reg		clr_sig;
	// assign 	ras_en=!gpu_afull&&!gpu_wafull;	
	// wire		valid_d1;
	// assign	valid_d1=ras_en&&(!clr_sig);
	
	tri_raster inst_tri_rast (						
		    .clk_i(clk),            						
		    .reset_i(!nrst_done),
			.pix_ready_o(pix_ready_raster),
			.pix_valid_i(pix_valid_sys),
			.v0_reg_i(pix_data_v0),
			.v1_reg_i(pix_data_v1),
			.v2_reg_i(pix_data_v2),
			.area_reg_i(area),
			.valid_pix_o(valid_pix_raster),
			//.ready_pix_i(ras_en),
			.ready_pix_i(pix_ready_zbuffer),
			//.pix_data_o(pix_data_param) // [276:0]
			.pix_data_o(pix_data_raster) 
		);   
		
	tri_z_buffer	inst_tri_z_buffer(
			.clk_i(clk),
			.reset_i(!nrst_done),
			.ras_en_i(ras_en),
			.pix_ready_o(pix_ready_zbuffer),
			.pix_valid_i(valid_pix_raster),
			.pix_data_i(pix_data_raster),
			.valid_pix_o(valid_pix_zbuffer),
			.ready_pix_i(pix_ready_vertex),
			.pix_data_o(pix_data_zbuffer)
		);
	
	tri_vertex_color inst_tri_vertex_color(
			.clk_i(clk),
			.reset_i(!nrst_done),
			.pix_ready_o(pix_ready_vertex),
			.pix_valid_i(valid_pix_zbuffer),
			.pix_data_i(pix_data_zbuffer),
			.valid_pix_o(valid_pix_vertex),
			.ready_pix_i(pix_ready_texture),
			.pix_data_o(pix_data_vertex)
		);
	
	tri_texture_map	inst_tri_texture_map(
			.clk_i(clk),
			.reset_i(!nrst_done),
			.Ver_Tex_i(Ver_Tex),
			.pix_ready_o(pix_ready_texture),
			.pix_valid_i(valid_pix_vertex),
			.pix_data_i(pix_data_vertex),
			.valid_pix_o(valid_pix_texture),
			.ready_pix_i(ras_en),
			.pix_data_o(pix_data_param)
		);

	buffer_RAM	inst0_buffer_RAM(
		.clka(clk),
		.dina(dina_buf),//24
		.addra(addra_buf),
		.wea(wea_buf),
		.clkb(clk),
		.addrb(addrb_buf),
		.doutb(doutb_buf) //24
		);
	
	// buffer_RAM	inst0_buffer_RAM(
		// .clka(clk),
		// .dina(dina_buffer0),//24
		// .addra(addra_buffer0),
		// .wea(wea_buffer0),
		// .clkb(clk),
		// .addrb(addrb0),
		// .doutb(doutb0) //24
		// );
		
	// buffer_RAM	inst1_buffer_RAM(
		// .clka(clk),
		// .dina(dina_buffer1),//24
		// .addra(addra_buffer1),
		// .wea(wea_buffer1),
		// .clkb(clk),
		// .addrb(addrb1),
		// .doutb(doutb1) //24
		// );
	
	reg		[8:0]	pix_x;
	reg		[7:0]	pix_y;
	reg		valid, valid_d0;
	
	always @(posedge clk) begin
		if(!nrst_done) begin
			pix_x<=0;
			pix_y<=0; end
		else if(valid_pix_texture) begin
			valid<=1;
			pix_x<=pix_data_param[40:32];
			pix_y<=pix_data_param[31:24]; end
		else valid<=0;
	end

	assign	addry_out=pixcel_row[9:1]*320;
	
	always @(posedge clk) begin 
		addrb_buf <=pixcel_col[9:1]+addry_out;
	end	
	
	// always@* begin
		// case (state_rgb) 
		// 1'b0: begin
			// vga_in_r<=doutb0[23:16];
			// vga_in_g<=doutb0[15:8];
			// vga_in_b<=doutb0[7:0];end
		// 1'b1: begin
			// vga_in_r<=doutb1[23:16];
			// vga_in_g<=doutb1[15:8];
			// vga_in_b<=doutb1[7:0];end
		// endcase
	// end
	
	// assign	vga_in_r=doutb0[23:16];
	// assign	vga_in_g=doutb0[15:8];
	// assign	vga_in_b=doutb0[7:0];
	
	assign	vga_in_r=doutb_buf[23:16];
	assign	vga_in_g=doutb_buf[15:8];
	assign	vga_in_b=doutb_buf[7:0];

	assign	addry_in=pix_y*320;
	
	always @(posedge clk) begin
		case (state) 
		1'b0: begin			
			if(addra_buf==76799) begin
				ras_en<=1;
				wea_buf<=0;
				state<=1'd1; end
			else begin
				ras_en<=0;
				wea_buf<=1;
				addra_buf<=addra_buf+1;
				dina_buf<={8'd255, 8'd255, 8'd255};end end
		1'b1: begin
			if(valid) begin	
				wea_buf<=1;
				addra_buf<=pix_x+addry_in;
				dina_buf<=pix_data_param[23:0];end
				//dina_buffer<={8'd255, 8'd0,8'd0};end
				//dina_buffer<={red, green, blue}; end
			else begin
				wea_buf<=0;
				addra_buf<=0;
				dina_buf<=0;end
			//if(sys_eof) begin
			if(Clc_scr)begin
				addra_buf<=0;
				dina_buf<={8'd255, 8'd255, 8'd255};
				state<=1'b0; end
			else	state<=1'b1;	end
		endcase
	end
	
	// always @(posedge clk) begin
		// case (state) 
		// 2'b00: begin
			// addrb0<=addrb;
			// wea_buffer0<=0;
			// ras_en<=0;
			// if(addra_buffer0==76799) begin
				// state<=2'b01; end
			// else begin
				// state<=2'b00;
				// addra_buffer0<=addra_buffer0+1;
				// dina_buffer0<={8'd255, 8'd255, 8'd255};end end
		// 2'b01: begin
			// addrb0<=addrb;
			// wea_buffer0<=1;
			// ras_en<=1;
			// if(valid) begin				
				// addra_buffer0<=pix_x+addry_in;
				// dina_buffer0<=pix_data_param[23:0];end
				// //dina_buffer<={8'd255, 8'd0,8'd0};end
				// //dina_buffer<={red, green, blue}; end
			// if(sys_eof) begin
				// addra_buffer0<=0;
				// state<=2'b00; end
			// else	state<=2'b01;	end
		// endcase
	// end
	
	
	// always @(posedge clk) begin
		// case (state) 
		// 2'b00: begin
			// addrb1<=addrb;
			// state_rgb<=1'b1;
			// wea_buffer1<=0;
			// wea_buffer0<=1;
			// ras_en<=0;
			// if(addra_buffer0==76799) begin
				// state<=2'b01; end
			// else begin
				// state<=2'b00;
				// addra_buffer0<=addra_buffer0+1;
				// dina_buffer0<={8'd255, 8'd255, 8'd255};end end
		// 2'b01: begin
			// addrb1<=addrb;
			// state_rgb<=1'b1;
			// wea_buffer1<=0;
			// wea_buffer0<=1;
			// ras_en<=1;
			// if(valid) begin				
				// addra_buffer0<=pix_x+addry_in;
				// dina_buffer0<=pix_data_param[23:0];end
				// //dina_buffer<={8'd255, 8'd0,8'd0};end
				// //dina_buffer<={red, green, blue}; end
			// if(sys_eof) begin
				// addra_buffer1<=0;
				// state<=2'b10; end
			// else	state<=2'b01;	end
		// 2'b10: begin
			// addrb0<=addrb;
			// state_rgb<=1'b0;
			// wea_buffer0<=0;
			// wea_buffer1<=1;
			// ras_en<=0;
			// if(addra_buffer1==76799) begin
				// state<=2'b11; end
			// else begin
				// state<=2'b10;
				// addra_buffer1<=addra_buffer1+1;
				// dina_buffer1<={8'd255, 8'd255, 8'd255};end end
		// 2'b11: begin
			// addrb0<=addrb;
			// state_rgb<=1'b0;
			// wea_buffer0<=0;
			// wea_buffer1<=1;
			// ras_en<=1;
			// if(valid) begin
				// addra_buffer1<=pix_x+addry_in;
				// dina_buffer1<=pix_data_param[23:0];end
				// //dina_buffer<={8'd255, 8'd0,8'd0};end
				// //dina_buffer<={red, green, blue}; end
			// if(sys_eof) begin
				// addra_buffer0<=0;
				// state<=2'b00; end
			// else	state<=2'b11;	end
		// endcase
	// end
	
		
	// always @(posedge clk) begin
		// if(!nrst_done) begin
			// state_eof<=2'b00;
			// clr_sig<=1;end
		// else begin
			// case(state_eof)
			// 2'b00: begin
				// clr_sig<=1;
				// state_eof <= 2'b01;end
			// 2'b01: begin				
				// if(gpu_addr_clr==240*320-1) begin
					// state_eof<=2'b10;
					// clr_sig<=0;end	end
			// 2'b10: begin			
				// if(sys_eof) begin
					// clr_sig<=1;
					// state_eof<=2'b01;end	end
			// default state_eof<=2'b00;
			// endcase
		// end
	// end

//-----------ad9980 with address of 0x4c-----------------------------------------------
	iic_init iic_init_inst 
	(
		.clk(clk), 
		.Reset_n(nrst_done), 
		.SDA(sda_pin), 
		.SCL(scl_pin), 
		.Done(done)
	);
	

//-----------Instantiate the hsync module--in 640X480 MODE-----------------------------
	h_sync
		#(
			.PULSE_LENGTH(96),
			.BACK_PORCH(48),
			.ACTIVE_VIDEO(640),
			.FRONT_PORCH(16)				
		)
		h_sync_inst(
			.clk(vga_clk), 
			.rst(nrst_done),
			//.h_en(1),
			.vsync_rst(vsync_rst), 
			.h_sync(h_sync), 
			.h_de(h_de),
			.gate(vsync_enable),
			.pixcel_col(pixcel_col) 
    	);	

//-----------Instantiate the vsync module-----------------------------------------------
	v_sync
		#(
			.PULSE_LENGTH(2),
			.BACK_PORCH(31),
			.ACTIVE_VIDEO(480),
			.FRONT_PORCH(11)			
		)
		v_sync_inst(
			.clk(vga_clk), 
			.rst(vsync_rst),
			.v_en(1), 
			.clk_hsync(~h_sync), 
			.v_sync(v_sync), 
			.v_de(v_de),
			.gate(eof_enable),
			.pixcel_row(pixcel_row)
    	);

	dvi_out dvi_out_inst (
	    .h_sync(h_sync), 
	    .v_sync(v_sync), 
	    .dvi_de_in(dvi_de_tmp), 
	    .clk_pix(vga_clk), 
	    .red(vga_in_r), 
	    .green(vga_in_g), 
	    .blue(vga_in_b), 
	    .dvi_h(dvi_h), 
	    .dvi_v(dvi_v), 
	    .dvi_de_out(dvi_de), 
	    .dvi_xclk_p(dvi_xclk_p), 
	    .dvi_xclk_n(dvi_xclk_n), 
	    .dvi_d(dvi_d_obuf)
	    );  
		
	 wire [35:0] CONTROL0;
	 wire [35:0] CONTROL1;
	 wire [35:0] CONTROL2;
	
	 icon1 icon1_inst(
			 .CONTROL0(CONTROL0),
			 .CONTROL1(CONTROL1),
			 .CONTROL2(CONTROL2)
		 );
		
	ila1 ila1_inst(
			.CLK(v0_push), 
			.CONTROL(CONTROL0), 
			.TRIG0(pix_data[96:88]), 
			.TRIG1(pix_data[87:80]),
			.TRIG2(pix_data[15:8]),
			.TRIG3(pix_data[7:0])
			//.TRIG2(x2_l), 
			//.TRIG3(y0_l), 
			//.TRIG4(y1_l), 
			//.TRIG5(y2_l), 
			//.TRIG2(pix_ready), 
			//.TRIG3(pix_valid)
		);
	
	ila4 ila4_inst(
		.CLK(v0_pop),
		.CONTROL(CONTROL2),
		.TRIG0(douta[96:88]),
		.TRIG1(douta[87:80])
	);
		
	ila3 ila3_inst(
			.CLK(set_valid),
			.CONTROL(CONTROL1),
			.TRIG0(x0_l),
			.TRIG1(x1_l),
			.TRIG2(x2_l),
			.TRIG3(y0_l),
			.TRIG4(y1_l),
			.TRIG5(y2_l)
		);
    
	       
endmodule
