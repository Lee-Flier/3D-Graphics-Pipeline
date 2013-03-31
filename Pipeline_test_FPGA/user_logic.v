module user_logic
(
  // -- ADD USER PORTS BELOW THIS LINE ---------------
  // --USER ports added here 
 zbt_mbox_sel ,
 zbt_mbox_we ,
 zbt_mbox_addr ,
 zbt_mbox_wdata ,
 zbt_mbox_rdata ,
 zbt_mbox_wdone ,
 zbt_mbox_dval ,
 zbt_dcm_lock ,
  
  
 video_enable_o ,
 gpu_enable_o ,
 background_o ,
 
 zmax_o ,
 
 color_in_o ,
 x_in_o ,
 y_in_o ,
 z_in_o ,
 w_in_o ,
 point_trig_o , 
 Tx_in_o,
 Ty_in_o,
 
 matrix_we ,
 matrix_sel ,  // xin hao yao tong shi dao da 
 matrix_waddr, 
 matrix_wdata ,
 
 pix_valid,
 eof_i , // shao le zhong duan de jie kou  yao gai de 
  // -- ADD USER PORTS ABOVE THIS LINE ---------------

  // -- DO NOT EDIT BELOW THIS LINE ------------------
  // -- Bus protocol ports, do not add to or delete 
  Bus2IP_Clk,                     // Bus to IP clock
  Bus2IP_Reset,                   // Bus to IP reset
  Bus2IP_Data,                    // Bus to IP data bus
  Bus2IP_BE,                      // Bus to IP byte enables
  Bus2IP_RdCE,                    // Bus to IP read chip enable
  Bus2IP_WrCE,                    // Bus to IP write chip enable
  IP2Bus_Data,                    // IP to Bus data bus
  IP2Bus_RdAck,                   // IP to Bus read transfer acknowledgement
  IP2Bus_WrAck,                   // IP to Bus write transfer acknowledgement
  IP2Bus_Error                    // IP to Bus error response
  // -- DO NOT EDIT ABOVE THIS LINE ------------------
); // user_logic

// -- ADD USER PARAMETERS BELOW THIS LINE ------------
// --USER parameters added here 
// -- ADD USER PARAMETERS ABOVE THIS LINE ------------

// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol parameters, do not add to or delete
parameter C_SLV_DWIDTH                   = 32;  // zhu yao shi register data  width 
parameter C_NUM_REG                      = 32;  // register de number 
// -- DO NOT EDIT ABOVE THIS LINE --------------------

// -- ADD USER PORTS BELOW THIS LINE -----------------
// --USER ports added here 
 output video_enable_o ; 
 output gpu_enable_o ;
 // Background color 
 output [35:0] background_o ;
// End of file 
 input pix_valid;
 input eof_i;  // yong yu zhong duan  interrupt
// Matrix Input
 output matrix_we ;  // yi ge zhou qi chu li 
 output [1:0] matrix_sel ; // ke yi chang shi jian de chu li
 output [3:0] matrix_waddr ; // ju zheng de di address 
 output [127:0] matrix_wdata ; // 127 wei bit di zhi 
// Pixel input 
 output [31:0] x_in_o ;
 output [31:0] y_in_o ;
 output [31:0] z_in_o ; 
 output [31:0] w_in_o ;
 output [31:0] color_in_o ; //  ke yi chang shi jian de chu li 
 output point_trig_o ; // yi ge zhou qi you xiao de 
 output [31:0]	Tx_in_o;
 output [31:0]	Ty_in_o;
// ZBT DCM lock 
 input zbt_dcm_lock;  // yong yu dui dcm manager de chi li 
 // Clipping Zmax 
 output [31:0] zmax_o ; // zui da zhi 
 // Debug zbt memory interface.
 output zbt_mbox_sel ; // quan zhi  yi ci you xiao 
 output zbt_mbox_we ;  // read or write  ke yi chu li yi xia de 
 output [19:0] zbt_mbox_addr ;  // cpu de 20 wei bit de xin hao  qi ta de wei 19 bit 
 output [35:0] zbt_mbox_wdata ;
 input  [35:0] zbt_mbox_rdata ;
 input zbt_mbox_wdone ; // fan hui qi hao 
 input zbt_mbox_dval ; // zhu yao de chu li 
// -- ADD USER PORTS ABOVE THIS LINE -----------------

// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol ports, do not add to or delete
input                                     Bus2IP_Clk;
input                                     Bus2IP_Reset;
input      [0 : C_SLV_DWIDTH-1]           Bus2IP_Data;
input      [0 : C_SLV_DWIDTH/8-1]         Bus2IP_BE;  // zhu yao wei 4 bit data width you guang
input      [0 : C_NUM_REG-1]              Bus2IP_RdCE; //  32 bit wei du xie de register de address 
input      [0 : C_NUM_REG-1]              Bus2IP_WrCE; // 
output     [0 : C_SLV_DWIDTH-1]           IP2Bus_Data;
output                                    IP2Bus_RdAck;  // dou shi wo shuo signal 
output                                    IP2Bus_WrAck;
output                                    IP2Bus_Error;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  // --USER nets declarations added here, as needed for user logic
  //reg   [31:0]   ID_Register = 32'hBEFF0006; 
  //reg   [31:0]   Status_Register ;
  
  
  reg   point_trig_o;  //Vector Write Enable
  reg   matrix_we;  // wei output
 // reg   zbt_mbox_sel; // output 
  reg   gpu_enable_o; // output
  reg   video_enable_o; // output 
  reg [17:0]  background_color ;
  reg [17:0]  background_depth ;
  
  //reg [31:0] slv_reg2_i;
  reg [31:0] slv_reg10_i;
  reg [31:0] slv_reg16_i;     //Vector X Coordinate Data Register  Read or Write 0x3C0         
  reg [31:0] slv_reg17_i;     //Vector Y Coordinate Data Register  Read or Write 0x3C4
  reg [31:0] slv_reg18_i; //Vector Z Coordinate Data Register  Read or Write 0x3C8
  reg [31:0] slv_reg19_i; //Vector W Coordinate Data Register  Read or Write 0x3CC,
  reg [31:0] slv_reg20_i; //Vector Color Data Register Read or Write 0x3D0,
  reg	[31:0] slv_reg24_i;
  reg [31:0] slv_reg25_i;
  reg	[31:0] fifo_ready;
  reg	[31:0] eof_state;
  
  reg [31:0] slv_reg11_i;     //Vector X Coordinate Data Register  Read or Write 0x3C0         
  reg [31:0] slv_reg12_i;     //Vector Y Coordinate Data Register  Read or Write 0x3C4
  reg [31:0] slv_reg13_i; //Vector Z Coordinate Data Register  Read or Write 0x3C8
  reg [31:0] slv_reg14_i; //Vector W Coordinate Data Register  Read or Write 0x3CC,
  reg [31:0] slv_reg15_i; //Vector Color Data Register Read or Write 0x3D0,
  reg A;
  reg B;
  reg C;
  reg D;
  
  reg [31:0] slv_reg8_buf_i;
  reg [31:0] slv_reg9_buf_i;
  
  reg zbt_we;
  reg zbt_re;
  reg zbt_mbox_sel_buf ;
  reg zbt_mbox_we_buf ;
  reg [19:0] zbt_mbox_addr_buf ;
  reg [31:0] zbt_mbox_wdata_buf0;
  reg [3:0]  zbt_mbox_wdata_buf1;
  
  reg [31:0] zbt_data0_register;
  reg [31:0] zbt_data1_register;
  
  reg slv_delay1;
  reg slv_delay2;
  reg slv_delay3;
  reg slv_delay4;
  reg slv_delay5;
  reg slv_delay6;
  
  reg matrix_we_delay0;
  reg matrix_we_delay1;
  
  //reg state_read;
  //reg [31:0] state_register;
  //reg [31:0] cpu_data_register0, cpu_data_register1;

  // Nets for user logic slave model s/w accessible register example  zai dao xiang  xuan zhe de shi hou jiu you ti shi de 
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg0;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg1;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg2;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg3;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg4;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg5;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg6;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg7;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg8;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg9;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg10;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg11;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg12;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg13;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg14;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg15;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg16;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg17;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg18;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg19;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg20;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg21;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg22;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg23;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg24;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg25;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg26;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg27;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg28;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg29;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg30;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg31;
  wire       [0 : 31]                       slv_reg_write_sel;   //  yong yu di zi de xuan zhe  
  wire       [0 : 31]                       slv_reg_read_sel;  //  
  reg        [0 : C_SLV_DWIDTH-1]           slv_ip2bus_data; // shu ju 
  wire                                      slv_read_ack;
  wire                                      slv_write_ack;
  integer                                   byte_index, bit_index;  // wei zhi shi  zhi jie zhi shi 

  // --USER logic implementation added here

  // ------------------------------------------------------
  // Example code to read/write user logic slave model s/w accessible registers
  // 
  // Note:
  // The example code presented here is to show you one way of reading/writing
  // software accessible registers implemented in the user logic slave model.
  // Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  // to one software accessible register by the top level template. For example,
  // if you have four 32 bit software accessible registers in the user logic,
  // you are basically operating on the following memory mapped registers:
  // 
  //    Bus2IP_WrCE/Bus2IP_RdCE   Memory Mapped Register
  //                     "1000"   C_BASEADDR + 0x0
  //                     "0100"   C_BASEADDR + 0x4
  //                     "0010"   C_BASEADDR + 0x8
  //                     "0001"   C_BASEADDR + 0xC
  // 
  // ------------------------------------------------------

  assign
    slv_reg_write_sel = Bus2IP_WrCE[0:31], // wire signal 
    slv_reg_read_sel  = Bus2IP_RdCE[0:31],
    slv_write_ack     = Bus2IP_WrCE[0] || Bus2IP_WrCE[1] || Bus2IP_WrCE[2] || Bus2IP_WrCE[3] || Bus2IP_WrCE[4] || Bus2IP_WrCE[5] || Bus2IP_WrCE[6] || Bus2IP_WrCE[7] || Bus2IP_WrCE[8] || Bus2IP_WrCE[9] || Bus2IP_WrCE[10] || Bus2IP_WrCE[11] || Bus2IP_WrCE[12] || Bus2IP_WrCE[13] || Bus2IP_WrCE[14] || Bus2IP_WrCE[15] || Bus2IP_WrCE[16] || Bus2IP_WrCE[17] || Bus2IP_WrCE[18] || Bus2IP_WrCE[19] || Bus2IP_WrCE[20] || Bus2IP_WrCE[21] || Bus2IP_WrCE[22] || Bus2IP_WrCE[23] || Bus2IP_WrCE[24] || Bus2IP_WrCE[25] || Bus2IP_WrCE[26] || Bus2IP_WrCE[27] || Bus2IP_WrCE[28] || Bus2IP_WrCE[29] || Bus2IP_WrCE[30] || Bus2IP_WrCE[31],
    slv_read_ack      = Bus2IP_RdCE[0] || Bus2IP_RdCE[1] || Bus2IP_RdCE[2] || Bus2IP_RdCE[3] || Bus2IP_RdCE[4] || Bus2IP_RdCE[5] || Bus2IP_RdCE[6] || Bus2IP_RdCE[7] || Bus2IP_RdCE[8] || Bus2IP_RdCE[9] || Bus2IP_RdCE[10] || Bus2IP_RdCE[11] || Bus2IP_RdCE[12] || Bus2IP_RdCE[13] || Bus2IP_RdCE[14] || Bus2IP_RdCE[15] || Bus2IP_RdCE[16] || Bus2IP_RdCE[17] || Bus2IP_RdCE[18] || Bus2IP_RdCE[19] || Bus2IP_RdCE[20] || Bus2IP_RdCE[21] || Bus2IP_RdCE[22] || Bus2IP_RdCE[23] || Bus2IP_RdCE[24] || Bus2IP_RdCE[25] || Bus2IP_RdCE[26] || Bus2IP_RdCE[27] || Bus2IP_RdCE[28] || Bus2IP_RdCE[29] || Bus2IP_RdCE[30] || Bus2IP_RdCE[31];
 // zhe li shi wu yong de  basical no effort   du ji  ye shi geng ju zhou  clk xin hao lai de 

  // implement slave model register(s)
  always @( posedge Bus2IP_Clk )
    begin: SLAVE_REG_WRITE_PROC  // kai shi 

      if ( Bus2IP_Reset == 1 )
        begin
          slv_reg0 <= 0;
          slv_reg1 <= 0;
          slv_reg2 <= 0;
          slv_reg3 <= 0;
          slv_reg4 <= 0;
          slv_reg5 <= 0;
          slv_reg6 <= 0;
          slv_reg7 <= 0;
          slv_reg8 <= 0;
          slv_reg9 <= 0;
          slv_reg10 <= 0;
          slv_reg11 <= 0;
          slv_reg12 <= 0;
          slv_reg13 <= 0;
          slv_reg14 <= 0;
          slv_reg15 <= 0;
          slv_reg16 <= 0;
          slv_reg17 <= 0;
          slv_reg18 <= 0;
          slv_reg19 <= 0;
          slv_reg20 <= 0;
          slv_reg21 <= 0;
          slv_reg22 <= 0;
          slv_reg23 <= 0;
          slv_reg24 <= 0;
          slv_reg25 <= 0;
          slv_reg26 <= 0;
          slv_reg27 <= 0;
          slv_reg28 <= 0;
          slv_reg29 <= 0;
          slv_reg30 <= 0;
          slv_reg31 <= 0;
			
        end
      else
		    begin 
		
		 
          			 
        case ( slv_reg_write_sel )
          32'b10000000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )  //integer zhu yao always 
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg0[bit_index] <= Bus2IP_Data[bit_index];    // qi shi hai shi ting jian dan de  jiu  zhe zhong xie fa ke yi can kao yi xia 
          32'b01000000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg1[bit_index] <= Bus2IP_Data[bit_index];
          32'b00100000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg2[bit_index] <= Bus2IP_Data[bit_index];
          32'b00010000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg3[bit_index] <= Bus2IP_Data[bit_index];
          32'b00001000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg4[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000100000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg5[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000010000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg6[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000001000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg7[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000100000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg8[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000010000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg9[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000001000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg10[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000100000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg11[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000010000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg12[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000001000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg13[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000100000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg14[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000010000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg15[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000001000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg16[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000100000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg17[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000010000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg18[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000001000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg19[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000100000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg20[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000010000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg21[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000001000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg22[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000100000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg23[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000010000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg24[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000001000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg25[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000000100000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg26[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000000010000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg27[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000000001000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg28[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000000000100 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg29[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000000000010 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg30[bit_index] <= Bus2IP_Data[bit_index];
          32'b00000000000000000000000000000001 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg31[bit_index] <= Bus2IP_Data[bit_index];
          default : ;
        endcase
      end
    end // SLAVE_REG_WRITE_PROC

  // implement slave model register read mux
  always @( slv_reg_read_sel or slv_reg0 or fifo_ready or eof_state or slv_reg3 or slv_reg4 or slv_reg5 or slv_reg6 or slv_reg7 or slv_reg8 or slv_reg9 or slv_reg10 or slv_reg11 or slv_reg12 or slv_reg13 or slv_reg14 or slv_reg15 or slv_reg16 or slv_reg17 or slv_reg18 or slv_reg19 or slv_reg20 or slv_reg21 or slv_reg22 or slv_reg23 or slv_reg24 or slv_reg25 or slv_reg26 or slv_reg27 or slv_reg28 or slv_reg29 or slv_reg30 or slv_reg31 )
    begin: SLAVE_REG_READ_PROC  //wei zhu he logic circuit
             //state_read = 1;
      case ( slv_reg_read_sel )
		32'b10000000000000000000000000000000 : slv_ip2bus_data <= slv_reg0;
		32'b01000000000000000000000000000000 : slv_ip2bus_data <= fifo_ready;
        32'b00100000000000000000000000000000 : slv_ip2bus_data <= eof_state;
		32'b00010000000000000000000000000000 : slv_ip2bus_data <= slv_reg3;
        32'b00001000000000000000000000000000 : slv_ip2bus_data <= slv_reg4;
        32'b00000100000000000000000000000000 : slv_ip2bus_data <= slv_reg5;
        32'b00000010000000000000000000000000 : slv_ip2bus_data <= slv_reg6;
        32'b00000001000000000000000000000000 : slv_ip2bus_data <= slv_reg7;
        32'b00000000100000000000000000000000 : slv_ip2bus_data <= slv_reg8;
        32'b00000000010000000000000000000000 : slv_ip2bus_data <= slv_reg9;
        32'b00000000001000000000000000000000 : slv_ip2bus_data <= slv_reg10;
        32'b00000000000100000000000000000000 : slv_ip2bus_data <= slv_reg11;
        32'b00000000000010000000000000000000 : slv_ip2bus_data <= slv_reg12;
        32'b00000000000001000000000000000000 : slv_ip2bus_data <= slv_reg13;
        32'b00000000000000100000000000000000 : slv_ip2bus_data <= slv_reg14;
        32'b00000000000000010000000000000000 : slv_ip2bus_data <= slv_reg15;
        32'b00000000000000001000000000000000 : slv_ip2bus_data <= slv_reg16;
        32'b00000000000000000100000000000000 : slv_ip2bus_data <= slv_reg17;
        32'b00000000000000000010000000000000 : slv_ip2bus_data <= slv_reg18;
        32'b00000000000000000001000000000000 : slv_ip2bus_data <= slv_reg19;
        32'b00000000000000000000100000000000 : slv_ip2bus_data <= slv_reg20;
        32'b00000000000000000000010000000000 : slv_ip2bus_data <= slv_reg21;
        32'b00000000000000000000001000000000 : slv_ip2bus_data <= slv_reg22;
        32'b00000000000000000000000100000000 : slv_ip2bus_data <= slv_reg23;
        32'b00000000000000000000000010000000 : slv_ip2bus_data <= slv_reg24;
        32'b00000000000000000000000001000000 : slv_ip2bus_data <= slv_reg25;
        32'b00000000000000000000000000100000 : slv_ip2bus_data <= slv_reg26;
        32'b00000000000000000000000000010000 : slv_ip2bus_data <= slv_reg27;
        32'b00000000000000000000000000001000 : slv_ip2bus_data <= slv_reg28;
        32'b00000000000000000000000000000100 : slv_ip2bus_data <= slv_reg29;
        32'b00000000000000000000000000000010 : slv_ip2bus_data <= slv_reg30;
        32'b00000000000000000000000000000001 : slv_ip2bus_data <= slv_reg31;
        default : slv_ip2bus_data <= 0;
      endcase

    end // SLAVE_REG_READ_PROC

  // ------------------------------------------------------------
  // Example code to drive IP to Bus signals
  // ------------------------------------------------------------
  /////////////////////////////////////////////////////////////
 always @( posedge Bus2IP_Clk ) begin 
       
	  if ( slv_reg3[30] ==1) begin 
	       gpu_enable_o  = 1;
			 end
		  else 
		    begin
		    gpu_enable_o  = 0; 
			 end 
			  
	  if ( slv_reg3[31] ==1) begin 
	       video_enable_o  = 1;
			 end
		  else 
		     begin
		   video_enable_o  = 0; 
			  end 	  
	 end 		  

///////////////////////////////////////////////////////////////////////
  

 

always @ ( posedge Bus2IP_Clk   )  begin 
         
		slv_delay2 <= slv_reg23[31]; 
		slv_delay3 <= slv_reg23[30];
        slv_delay5 <= slv_delay2;
        slv_delay6 <= slv_delay3;
         
		  
 	if (  (slv_delay5 == 1) && (slv_delay2 == 0)) begin
	    zbt_mbox_sel_buf = 1;
        zbt_mbox_we_buf = 1 ;	
		zbt_mbox_addr_buf =  slv_reg6;end  
	else if( (slv_delay6 == 1) && (slv_delay3) == 0 ) begin
	    zbt_mbox_sel_buf = 1;
        zbt_mbox_we_buf = 0 ;	 
        zbt_mbox_addr_buf =  slv_reg7;   end
		else  begin 
		zbt_mbox_sel_buf  = 0;
        zbt_mbox_we_buf = 0 ;end 
    end    
	
 

/////////////////////////////////////////////////////////////



		 
///////////////////////////////////////////////////////////////////




	always @ ( posedge Bus2IP_Clk  ) begin 
     	  zbt_mbox_wdata_buf0 = slv_reg8;
		  zbt_mbox_wdata_buf1 = slv_reg9;
    end   

  assign zbt_mbox_sel = zbt_mbox_sel_buf;
  assign zbt_mbox_we =  zbt_mbox_we_buf;
  assign zbt_mbox_wdata[31:0] =  zbt_mbox_wdata_buf0;
  assign zbt_mbox_wdata[35:32] =  zbt_mbox_wdata_buf1;
  assign zbt_mbox_addr = zbt_mbox_addr_buf;    // zhe ge shi shi zhe qu de  hui zhi ji zhuan huang de qian ti shi  z
                                               // zai zi ji ding yi shi yao zhu yi 
                                               // yan yi bai 
  
 /* yi xia wei  dui x y z w yi ji color de cao zuo */ 
 
 assign x_in_o =  slv_reg16_i;     //Vector X Coordinate Data Register  Read or Write 0x3C0         
 assign y_in_o =  slv_reg17_i;      //Vector Y Coordinate Data Register  Read or Write 0x3C4
 assign z_in_o =  slv_reg18_i; //Vector Z Coordinate Data Register  Read or Write 0x3C8
 assign w_in_o =  slv_reg19_i; //Vector W Coordinate Data Register  Read or Write 0x3CC,
 assign color_in_o =  slv_reg20_i; //Vector Color Data Register Read or Write 0x3D0,
 assign	Tx_in_o = slv_reg24_i; // texture coordinate x
 assign	Ty_in_o = slv_reg25_i; // texture coordinate y
 
 

	always @( posedge Bus2IP_Clk ) begin 
      
		slv_reg16_i = slv_reg16;     //Vector X Coordinate Data Register  Read or Write 0x3C0         
		slv_reg17_i = slv_reg17;     //Vector Y Coordinate Data Register  Read or Write 0x3C4
		slv_reg18_i = slv_reg18; //Vector Z Coordinate Data Register  Read or Write 0x3C8
		slv_reg19_i = slv_reg19; //Vector W Coordinate Data Register  Read or Write 0x3CC,
		slv_reg20_i = slv_reg20; //Vector Color Data Register Read or Write 0x3D0,
		slv_reg24_i = slv_reg24; //texture coordiante x data register read or wirte 0x3D8
		slv_reg25_i = slv_reg25; //texture coordiante y data register read or wirte 0x3Dc,
 
	end 
 
   
 
	always @(  posedge Bus2IP_Clk ) begin 
        slv_delay1 <=slv_reg21[31]; 
		if ( slv_reg21[31] ==1 && slv_delay1 == 0) begin 
			point_trig_o = 1;  //Vector Write Enable Read or Write 0x3D4,
		end 
		else 
			point_trig_o = 0;		  
    end 	
 
 ////////////////////////////////////////////////////////////
 
	assign zmax_o = slv_reg10_i ;                //Clipping Z Maximum Register Read or Write 0x340
 
 

	always @( posedge Bus2IP_Clk ) begin 
      
		slv_reg10_i = slv_reg10;     //Vector X Coordinate Data Register  Read or Write 0x3C0         

	end 
 
//////////////////////////////////////////////////////////////////////


 
 
 
	always @(  posedge Bus2IP_Clk ) begin 
     	 	
		matrix_we_delay0 <= slv_reg22[31]; 
		matrix_we_delay1 <= matrix_we_delay0;		
		
		if ( (matrix_we_delay1 == 1) && (matrix_we_delay0 == 0))   // tian jia yi ju eof wei '1'
			matrix_we = 1;
		else 	
			matrix_we = 0;
			
    end 	
 
	always @( posedge Bus2IP_Clk ) begin       
		  slv_reg11_i = slv_reg11;     //Vector X Coordinate Data Register  Read or Write 0x3C0         
		  slv_reg12_i = slv_reg12;     //Vector Y Coordinate Data Register  Read or Write 0x3C4
		  slv_reg13_i = slv_reg13; //Vector Z Coordinate Data Register  Read or Write 0x3C8
		  slv_reg14_i = slv_reg14; //Vector W Coordinate Data Register  Read or Write 0x3CC,
		  A = slv_reg15[28];
		  B = slv_reg15[29];//Vector Color Data Register Read or Write 0x3D0,
		  C = slv_reg15[30];
		  D = slv_reg15[31];
	end 
 
   
	assign matrix_sel[0] = B;
	assign matrix_sel[1] = A ;
	assign matrix_waddr[0] = D ;
	assign matrix_waddr[1] = C ;
	assign matrix_waddr[2] = 0 ;
	assign matrix_waddr[3] = 0 ;
 
 
	assign matrix_wdata [31:0]   = slv_reg11_i;
	assign matrix_wdata [63:32]  = slv_reg12_i; 
	assign matrix_wdata [95:64]  = slv_reg13_i;
	assign matrix_wdata [127:96] = slv_reg14_i;
 
/////////////////////////////////////////////////////////////////////////////////////// 

	always @( posedge Bus2IP_Clk ) begin 
		background_color = slv_reg4;
	    background_depth = slv_reg5;
	end 	
	assign  background_o[17:0]  =  background_color;
	assign  background_o[35:18] =  background_depth;
///////////////////////////////////////////////////////////

  // always @( posedge Bus2IP_Clk) begin 
        // if( eof_i == 1) begin  		
             // state_register = 1;
			   // end
		  // else if( slv_reg2[3] == 1) 	begin
             // state_register = 0;
            // end
    // end 
	
	always @(posedge Bus2IP_Clk) begin
		if(eof_i==1) begin
			eof_state=32'd1; end
		else begin
			eof_state=32'd0; end
	end
	
	always @(posedge  Bus2IP_Clk) begin
		if(pix_valid==1) begin
			fifo_ready=32'd1; end
		else begin
			fifo_ready=32'd0; end
	end
	
	// always @(posedge Bus2IP_Clk) begin
		// slv_reg1=eof_i;
	// end
///////////////////////////////////////////////////////////////////

  assign IP2Bus_Data    = slv_ip2bus_data;
  assign IP2Bus_WrAck   = slv_write_ack;
  assign IP2Bus_RdAck   = slv_read_ack;
  assign IP2Bus_Error   = 0;

endmodule
