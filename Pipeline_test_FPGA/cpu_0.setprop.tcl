cd D:/gpu_test_v3_1122_20110621/gpu_test_20110813/cpu_0
if { [xload xmp cpu_0.xmp] != 0 } {
  exit -1
}
set xpsArch [xget arch]
if { ! [ string equal -nocase $xpsArch "virtex5" ] } {
   puts "Device Family setting in XPS ($xpsArch) does not match Device Family setting in ISE (virtex5)"
   exit -1
}
set xpsDev [xget dev]
if { ! [ string equal -nocase $xpsDev "xc5vlx110t" ] } {
   puts "Device setting in XPS ($xpsDev) does not match Device setting in ISE (xc5vlx110t)"
   exit -1
}
set xpsPkg [xget package]
if { ! [ string equal -nocase $xpsPkg "ff1136" ] } {
   puts "Package setting in XPS ($xpsPkg) does not match Package setting in ISE (ff1136)"
   exit -1
}
set xpsSpd [xget speedgrade]
if { ! [ string equal -nocase $xpsSpd "-1" ] } {
   puts "Speed Grade setting in XPS ($xpsSpd) does not match Speed Grade setting in ISE (-1)"
   exit -1
}
xset topinst cpu_0_i
#default language
xset hdl vhdl
xset intstyle ise
save proj
exit
