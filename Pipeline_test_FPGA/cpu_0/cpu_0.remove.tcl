cd E:/ISE/gpu_test/cpu_0
if { [xload xmp cpu_0.xmp] != 0 } {
  exit -1
}
xset intstyle default
save proj
exit 0
