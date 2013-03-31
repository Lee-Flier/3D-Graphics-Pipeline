//================================================================================================
//
// This mode provice variables for iic_init.v module
// created by mayr (myr@shu.edu.cn)
//
// Copyright (c) 2009 ITS, SHU. All rights reserved
//
// Rev		Author		Date		Changes
// -------------------------------------------------------------------------------------------------------
// 1.0		Myr			27/10/09	first release,provide variables for iic_init.v module
//=======================================================================================================
//------------init ch7301c register--------------------------------------
`ifdef	INIT_DVI_OUT
		parameter	
			CH7301_ADDR		=	7'b1110110,	//--ADDRESS:0x76;
			REG0_H21		=	8'h21,		//--DAC control register
	    	REG0_H33		=	8'h33,		//--------
	    	REG0_H34		=	8'h34,		//--deside by the data clock,the seprator is 65MHZ;LESS OR GREATER;
	    	REG0_H36		=	8'h36,		//--------
	    	REG0_H49		=	8'h49,		//--power management {49H}=[1 1 X X X X X 0]
	    	DATA0_H21		=	8'h09,		//--bit0 stand for not utilize the bypass mode,bit3 enable the hsync and vsync output
	    	DATA0_H33		=	8'h08,		//--------
	    	DATA0_H34		=	8'h16,		//--the output pixsel clock is less than 65MHZ,utilize the dual edge transfer mode--
	    	DATA0_H36		=	8'h60,		// -------
	    	DATA0_H49		=	8'hC0;		//--dvi encode,serialize transmitter,and pll on,DVI is normal function;
`endif	    
	//------------init ad9980 chip register-----------------------------------
`ifdef INIT_VGA_640_480_60
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 640x480 mode,this range is "01"and 640x480 with range is "100"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h32,			//--in 640x480 with 60HZ mode,the PLL_DIV should be "800",and divide into two section;
			DATA1_H02	=	8'h00,			//--and the PLL_DIV=12'H420=12'd1056
			DATA1_H03	=	8'h60,			//--bit7,6 stand for the vcorange,in 1024x768 with 75HZ mode ,it
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_VGA_640_480_72
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 640x480 mode,this range is "01"and 640x480 with range is "10"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h34,			//--in 640x480 with 72HZ mode,the PLL_DIV should be "832",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'h60,			//--bit7,6 stand for the vcorange,in 640x480 with 72HZ mode ,it
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_VGA_640_480_75
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 640x480 mode,this range is "01"and 640x480 with range is "100"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h34,			//--in 640x480 with 75HZ mode,the PLL_DIV should be "840",and divide into two section;
			DATA1_H02	=	8'h80,			
			DATA1_H03	=	8'h60,			//--bit7,6 stand for the vcorange,in 640x480 with 75HZ mode ,it shoul be "01"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_VGA_640_480_85
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 800x600 mode,this range is "01"and 640x480 with range is "10"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h34,			//--in 640x480 with 85HZ mode,the PLL_DIV should be "832",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'h68,			//--bit7,6 stand for the vcorange,in 640x480 with 85HZ mode ,it should be "01
											//--bit5,4,3 stand for the curent for PLL and it should be "101"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif		                                                                                                 
`ifdef INIT_SVGA_800_600_56
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 800x600 mode,this range is "01"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h40,			//--in 800x600 with 56HZ mode,the PLL_DIV should be "1024",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'h68,			//--bit7,6 stand for the vcorange,in 800_600 with 56HZ mode ,it should be "01"
											//--bit5,4,3 stand for the curent for PLL and it should be "101"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_SVGA_800_600_60
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 800x600 mode,this range is "01"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h42,			//--in 800x600 with 60HZ mode,the PLL_DIV should be "1056",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'h60,			//--bit7,6 stand for the vcorange,in 800*600 with 60HZ mode ,it should be "01"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_SVGA_800_600_72
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 800x600 mode,this range is "01"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h41,			//--in 800x600 with 72HZ mode,the PLL_DIV should be "1040",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'ha0,			//--bit7,6 stand for the vcorange,in 800x600 with 72HZ mode ,it should be "10"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_SVGA_800_600_75
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 800x600 mode,this range is "10"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h42,			//--in 800x600 with 75HZ mode,the PLL_DIV should be "1056",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'ha0,			//--bit7,6 stand for the vcorange,in 800x600 with 75HZ mode ,it should be "10"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_VGA_800_600_85
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 800x600 mode,this range is "10"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h41,			//--in 800x600 with 85HZ mode,the PLL_DIV should be "1048",and divide into two section;
			DATA1_H02	=	8'h80,			
			DATA1_H03	=	8'ha0,			//--bit7,6 stand for the vcorange,in 800x600 with 85HZ mode ,it should be "10"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_XGA_1024_768_60
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 1024x768 mode,this range is "10"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h54,			//--in 1024x768 with 60HZ mode,the PLL_DIV should be "1344",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'ha8,			//--bit7,6 stand for the vcorange,in 1024x768 with 60HZ mode ,it should be "10"
											//--bit5,4,3 stand for the curent for PLL and it should be "101"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_XGA_1024_768_70
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 1024x768 mode,this range is "01"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h53,			//--in 1024x768 with 70HZ mode,the PLL_DIV should be "1328",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'hb0,			//--bit7,6 stand for the vcorange,in 1024x768 with 70HZ mode ,it shoudd be "10"
											//--bit5,4,3 stand for the curent for PLL and it should be "110"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif	
`ifdef INIT_XGA_1024_768_75
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1312";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 1024x768 mode,this range is "01"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h52,			//--in 1024x768 with 75HZ mode,the PLL_DIV should be "1312",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'hb0,			//--bit7,6 stand for the vcorange,in 1024x768 with 75HZ mode ,it shoud be "10"
											//--bit5,4,3 stand for the curent for PLL and it should be "110"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif			
`ifdef INIT_XGA_1024_768_80
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1336";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 1024x768 mode,this range is "11"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h53,			//--in 1024x768 with 72HZ mode,the PLL_DIV should be "1336",and divide into two section;
			DATA1_H02	=	8'h80,			
			DATA1_H03	=	8'he0,			//--bit7,6 stand for the vcorange,in 1024x768 with 75HZ mode ,it should be "11"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif			
`ifdef INIT_XGA_1024_768_85
		parameter		
			AD9980_ADDR	=	7'b1001100,		//--ADDRESS:0X4C;
			REG1_H01	=	8'h01,			//--PLL_div[11:4]=PLL_div_msb[7:0];
			REG1_H02	=	8'h02,			//--PLL_div[3:0]=PLL_div_lsb[7:4];two secment make up of 12 bits register of "1056";
			REG1_H03	=	8'h03,			//--VCORANGE--in the 1024x768 mode,this range is "11"
			REG1_H04	=	8'h04,			//--phase adjustment(default value)
			REG1_H12	=	8'h12,			//--hsync control;
			REG1_H13	=	8'h13,			//--hsync duaration;
			REG1_H14	=	8'h14,			//--vsync control;
			REG1_H19	=	8'h19,			//--clamp placement;
			REG1_H1A	=	8'h1a,			//--clamp duaration;
			REG1_H1E	=	8'h1e,			//--power,select the rgb channel information;
			REG1_H1F	=	8'h1f,			//--output select 1;include output mode,primary/secondary output enable,and so on;
			REG1_H20	=	8'h20,			//--output select 2;include clock output and output impedence;
			DATA1_H01	=	8'h56,			//--in 1024x768 with 85HZ mode,the PLL_DIV should be "1376",and divide into two section;
			DATA1_H02	=	8'h00,			
			DATA1_H03	=	8'hb0,			//--bit7,6 stand for the vcorange,in 1024x768 with 85HZ mode ,it should be "11"
											//--bit5,4,3 stand for the curent for PLL and it should be "100"								
			DATA1_H04	=	8'h80,			//--default value;
			DATA1_H12	=	8'h98,			//--hsync control,hsync form external pin and active polraty of high;
			DATA1_H13	=	8'h20,			//--default value;
			DATA1_H14	=	8'h9c,			//--vsync control;
			DATA1_H19	=	8'h04,			//--clamp placement;default	value;
			DATA1_H1A	=	8'h3c,			//--clamp duaration;default value;
			DATA1_H1E	=	8'ha4,			//--power;
			DATA1_H1F	=	8'h14,			//--output select 1;
			DATA1_H20	=	8'h01;		//--output select 2;
`endif