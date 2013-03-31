setMode -bs
setMode -bs
setCable -port auto
Identify 
identifyMPM 
assignFile -p 5 -file "D:/gpu_test_v3_1122_20110621/gpu_test_20110813/top.bit"
Program -p 5 
setMode -bs
deleteDevice -position 1
deleteDevice -position 1
deleteDevice -position 1
deleteDevice -position 1
deleteDevice -position 1
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
