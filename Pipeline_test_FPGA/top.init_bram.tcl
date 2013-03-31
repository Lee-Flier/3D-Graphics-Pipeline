cd D:/gpu_test_v3_1122_20110621/gpu_test_20110813/cpu_0
if { [xload xmp cpu_0.xmp] != 0 } {
  exit -1
}
if { [catch {run init_bram} result] } {
  exit -1
}
exit 0
