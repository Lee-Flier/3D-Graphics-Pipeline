//================================================================================================
//
// initial modual for both ch7301 and ad9980 chip,
// created by mayr (myr@shu.edu.cn)
//
// Copyright (c) 2009 ITS, SHU. All rights reserved
//
// Rev		Author		Date		Changes
// -------------------------------------------------------------------------------------------------------
// 1.0		Myr			09/24/09	first release,consult with Xilinx reference and corresponding documdent
// 1.1		Myr			27/10/09	revise the structure of this module and devide the module into variables
//									module part and function module	parts
//=======================================================================================================

module iic_init
		( 
		clk,                          //I
		Reset_n,                      //I
		SDA,                          //IO
		SCL,                          //IO
		Done                          //O
		);
   
		input clk;
		input Reset_n;
		inout SDA;
		inout SCL;
		//output SDA;
		//output SCL;
		output Done;
//--------------------------------MODE SELECTION-----------------------------------//
	`define	INIT_DVI_OUT
	//--`define INIT_VGA_640_480_60
	//--`define INIT_VGA_640_480_72
	//--`define INIT_VGA_640_480_75
	//--`define INIT_VGA_640_480_85
	//--`define INIT_SVGA_800_600_56
	`define INIT_SVGA_800_600_60
	//--`define INIT_SVGA_800_600_72
	//--`define INIT_SVGA_800_600_75
	//--`define INIT_SVGA_800_600_85
	//--`define INIT_XGA_1024_768_60
	//--`define INIT_XGA_1024_768_70
	//--`define INIT_XGA_1024_768_75
	//--`define INIT_XGA_1024_768_80
	//--`define INIT_XGA_1024_768_85	
`include "iic_init_mode.v" 	
//---------------------------------------------------------------------------------//	
	parameter 
		CLK_RATE_MHZ		=	200,
		SCK_PERIOD_US		=	30,
		TRANSITION_CYCLE	=	(CLK_RATE_MHZ * SCK_PERIOD_US) / 2,
		TRANSITION_CYCLE_MSB=	11,
		SDA_BUFFER_MSB		=	27,
		INIT_NUM			=	16;		      
	parameter	
	//-----------state machine for iic logic--------------------------------
		IDLE			=	3'd0,
		INIT			=	3'd1,
		START			=	3'd2,
        CLK_FALL		=	3'd3,
        SETUP			=	3'd4,
        CLK_RISE		=	3'd5,
        WAIT			=	3'd6,
	    START_BIT		=	1'b1,
        ACK				=	1'b1,
        STOP_BIT		=	1'b0,
        WRITE			=	1'b0;


reg									SDA_out; 
reg									SCL_out;  
reg		[TRANSITION_CYCLE_MSB:0] 	cycle_count;
reg 	[2:0] 						c_state;
reg 	[2:0] 						n_state;
reg 								Done;   
reg 	[4:0]						write_count;
reg		[31:0]						bit_count;
reg 	[SDA_BUFFER_MSB:0] 			SDA_BUFFER;
wire 								transition; 

always @ (posedge clk) begin
    if (~Reset_n||c_state==IDLE ) begin
        SDA_out <= 1'b1;
        SCL_out <=1'b1;
    end
    else if (c_state==INIT && transition) begin 
        SDA_out <=1'b0;
    end
    else if (c_state==SETUP) begin
        SDA_out <=SDA_BUFFER[SDA_BUFFER_MSB];
    end
    else if (c_state==CLK_RISE && cycle_count==TRANSITION_CYCLE/2 && bit_count==SDA_BUFFER_MSB) begin
        SDA_out <= 1'b1;
    end
    else if (c_state==CLK_FALL) begin
        SCL_out <=1'b0;
    end
    
    else if (c_state==CLK_RISE) begin
        SCL_out <=1'b1;
    end
end
assign SDA = SDA_out;
assign SCL = SCL_out;
 			            
always @ (posedge clk) begin
    //-----------------------------reset or end condition------------------------
    if(~Reset_n) begin
       SDA_BUFFER <= {CH7301_ADDR,WRITE,ACK,REG0_H49,ACK,DATA0_H49,ACK,STOP_BIT};
       cycle_count<=0;
      
    end
    //-----------------------------setup sda for sck rise------------------------
    else if ( c_state==SETUP && cycle_count==TRANSITION_CYCLE)begin
       SDA_BUFFER <= {SDA_BUFFER[SDA_BUFFER_MSB-1:0],1'b0};
       cycle_count<=0; 
    end
    //-----------------------------reset count at end of state--------------------
    else if ( cycle_count==TRANSITION_CYCLE)
       cycle_count<=0; 
    else if (c_state==WAIT)begin
       case(write_count)
	 0:SDA_BUFFER	<= {CH7301_ADDR,WRITE,ACK,REG0_H21,ACK,DATA0_H21,ACK,STOP_BIT};
	 1:SDA_BUFFER	<= {CH7301_ADDR,WRITE,ACK,REG0_H33,ACK,DATA0_H33,ACK,STOP_BIT};
	 2:SDA_BUFFER	<= {CH7301_ADDR,WRITE,ACK,REG0_H34,ACK,DATA0_H34,ACK,STOP_BIT};
	 3:SDA_BUFFER	<= {CH7301_ADDR,WRITE,ACK,DATA0_H36,ACK,DATA0_H36,ACK,STOP_BIT};
	 4:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H01,ACK,DATA1_H01,ACK,STOP_BIT};
	 5:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H02,ACK,DATA1_H02,ACK,STOP_BIT};
	 6:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H03,ACK,DATA1_H03,ACK,STOP_BIT};
	 7:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H04,ACK,DATA1_H04,ACK,STOP_BIT};
	 8:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H12,ACK,DATA1_H12,ACK,STOP_BIT};
	 9:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H13,ACK,DATA1_H13,ACK,STOP_BIT};
	 10:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H14,ACK,DATA1_H14,ACK,STOP_BIT};
	 11:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H19,ACK,DATA1_H19,ACK,STOP_BIT};
	 12:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H1A,ACK,DATA1_H1A,ACK,STOP_BIT};
	 13:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H1E,ACK,DATA1_H1E,ACK,STOP_BIT};
	 14:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H1F,ACK,DATA1_H1F,ACK,STOP_BIT};
	 15:SDA_BUFFER	<= {AD9980_ADDR,WRITE,ACK,REG1_H20,ACK,DATA1_H20,ACK,STOP_BIT};
	 default: SDA_BUFFER <=28'dx;
       endcase 
       cycle_count<=cycle_count+1;
    end
    else
       cycle_count<=cycle_count+1;
end

always @ (posedge clk) begin 
 if(~Reset_n)
   write_count<=5'd0;
 else if (c_state==WAIT && cycle_count==TRANSITION_CYCLE)
   write_count<=write_count+1;
end    

   			            
always @ (posedge clk) begin
    if(~Reset_n)
      Done<=1'b0;
    else if (c_state==IDLE)
      Done<=1'b1;
end
          
always @ (posedge clk) begin
    if(~Reset_n||(c_state==WAIT)) 
       bit_count<=0;
    else if ( c_state==CLK_RISE && cycle_count==TRANSITION_CYCLE)
       bit_count<=bit_count+1;
end    

always @ (posedge clk) begin
    if(~Reset_n)
       c_state<=INIT;
    else 
       c_state<=n_state;
end    

assign transition = (cycle_count==TRANSITION_CYCLE); 
              
//Next state              
always @ (*) begin
   case(c_state) 
       IDLE: begin
          if(~Reset_n) n_state = INIT;
          else n_state = IDLE;
       end
       INIT: begin
          if (transition) n_state = START;
          else n_state = INIT;
       end
       START: begin
          if(~Reset_n) n_state = INIT;
          else if( transition) n_state = CLK_FALL;
          else n_state = START;
       end
       CLK_FALL: begin
          if(~Reset_n) n_state = INIT;
          else if( transition) n_state = SETUP;
          else n_state = CLK_FALL;
       end
       SETUP: begin
          if(~Reset_n) n_state = INIT;
          else if( transition) n_state = CLK_RISE;
          else n_state = SETUP;
       end
       CLK_RISE: begin
          if(~Reset_n) 
             n_state = INIT;
          else if( transition && bit_count==SDA_BUFFER_MSB) 
             n_state = WAIT;
          else if (transition )
             n_state = CLK_FALL;  
          else n_state = CLK_RISE;
       end  
       WAIT: begin
          if(~Reset_n|(transition && write_count!=INIT_NUM)) 
             n_state = INIT;
          else if (transition )
             n_state = IDLE;  
          else n_state = WAIT;
       end 
       default: n_state = IDLE;
     
   endcase
end
endmodule
