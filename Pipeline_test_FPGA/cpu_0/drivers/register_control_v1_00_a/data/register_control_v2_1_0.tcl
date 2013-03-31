##############################################################################
## Filename:          D:\xiao\test\cpu_0/drivers/register_control_v1_00_a/data/register_control_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Sat Oct 23 11:30:27 2010 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "register_control" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
