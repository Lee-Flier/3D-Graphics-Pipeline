Version 4
SymbolType BLOCK
TEXT 32 32 LEFT 4 float18_div_translation
RECTANGLE Normal 32 32 480 384
LINE Wide 0 80 32 80
PIN 0 80 LEFT 36
PINATTR PinName a[17:0]
PINATTR Polarity IN
LINE Wide 0 112 32 112
PIN 0 112 LEFT 36
PINATTR PinName b[17:0]
PINATTR Polarity IN
LINE Normal 0 208 32 208
PIN 0 208 LEFT 36
PINATTR PinName operation_nd
PINATTR Polarity IN
LINE Normal 0 240 32 240
PIN 0 240 LEFT 36
PINATTR PinName operation_rfd
PINATTR Polarity OUT
LINE Normal 144 416 144 384
PIN 144 416 BOTTOM 36
PINATTR PinName clk
PINATTR Polarity IN
LINE Wide 512 80 480 80
PIN 512 80 RIGHT 36
PINATTR PinName result[17:0]
PINATTR Polarity OUT
LINE Normal 512 112 480 112
PIN 512 112 RIGHT 36
PINATTR PinName underflow
PINATTR Polarity OUT
LINE Normal 512 144 480 144
PIN 512 144 RIGHT 36
PINATTR PinName overflow
PINATTR Polarity OUT
LINE Normal 512 176 480 176
PIN 512 176 RIGHT 36
PINATTR PinName invalid_op
PINATTR Polarity OUT
LINE Normal 512 208 480 208
PIN 512 208 RIGHT 36
PINATTR PinName divide_by_zero
PINATTR Polarity OUT
LINE Normal 512 240 480 240
PIN 512 240 RIGHT 36
PINATTR PinName rdy
PINATTR Polarity OUT

