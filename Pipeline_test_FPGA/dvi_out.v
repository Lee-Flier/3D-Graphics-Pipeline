module dvi_out(
	input h_sync,
	input v_sync,
	input dvi_de_in,
	input clk_pix,
	input	[7:0]	red,
	input	[7:0]	green,
	input	[7:0]	blue,
	output 			dvi_h,
	output 			dvi_v,
	output 			dvi_de_out,
	output 			dvi_xclk_p,
	output 			dvi_xclk_n,
	output	[11:0]	dvi_d	
	);
	FDRSE D_DVI_H	(.Q(dvi_h),			.C(clk_pix),	.CE(1'b1),	.R(0), 				.D(h_sync))     ; 
    FDRSE D_DVI_V	(.Q(dvi_v),			.C(clk_pix),	.CE(1'b1),	.R(0), 				.D(v_sync))     ;
    FDRSE D_DVI_DE	(.Q(dvi_de_out),	.C(clk_pix),	.CE(1'b1),	.R(0), 				.D(dvi_de_in));
	//---generate the "dvi_xclk_n" and "dvi_xclk_p" signal for ch7301----------------------------------------------------------------------	        
    ODDR DVI_XCLK_P (.Q(dvi_xclk_p),	.C(clk_pix), 	.CE(1'b1),	.R(1'b0),			.D1(1'b0),			.D2(1'b1), .S(1'b0));
    ODDR DVI_XCLK_N (.Q(dvi_xclk_n),	.C(clk_pix), 	.CE(1'b1),	.R(1'b0),			.D1(1'b1),			.D2(1'b0), .S(1'b0));
    //---This demo is used for test color bar and other self-generated graph for detcting aiming-------------------------------------------  	
    ODDR DVI_D0  	(.Q(dvi_d[0]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(green[4]),	.D1(blue[0]),.S(1'b0));   
	ODDR DVI_D1		(.Q(dvi_d[1]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(green[5]),	.D1(blue[1]),.S(1'b0));   
	ODDR DVI_D2		(.Q(dvi_d[2]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(green[6]),	.D1(blue[2]),.S(1'b0));   
	ODDR DVI_D3		(.Q(dvi_d[3]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(green[7]),	.D1(blue[3]),.S(1'b0));   
	ODDR DVI_D4		(.Q(dvi_d[4]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[0]),	.D1(blue[4]),.S(1'b0));  
	ODDR DVI_D5		(.Q(dvi_d[5]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[1]),	.D1(blue[5]),.S(1'b0));  
	ODDR DVI_D6		(.Q(dvi_d[6]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[2]),	.D1(blue[6]),.S(1'b0));  
	ODDR DVI_D7		(.Q(dvi_d[7]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[3]),	.D1(blue[7]),.S(1'b0));  
	ODDR DVI_D8		(.Q(dvi_d[8]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[4]),	.D1(green[0]),.S(1'b0)); 
	ODDR DVI_D9		(.Q(dvi_d[9]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[5]),	.D1(green[1]),.S(1'b0)); 
	ODDR DVI_D10	(.Q(dvi_d[10]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[6]),	.D1(green[2]),.S(1'b0)); 
	ODDR DVI_D11	(.Q(dvi_d[11]),	.C(clk_pix),	.CE(1'b1),	.R(~dvi_de_in),	.D2(red[7]),	.D1(green[3]),.S(1'b0)); 
endmodule