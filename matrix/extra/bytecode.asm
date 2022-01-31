; picoMini by redpwn 2021 - MATRIX 500 points
; -------------------------------------------
; Byte code disassembly and annotations
; https://github.com/c0rner

; ====================================== PROGRAM START
0000  push 0x0075 	; INIT VARS
0003  push 0x00 ()
0005  push 0x0a ()
0007  push 0x3f (?)
0009  push 0x65 (e)
000b  push 0x76 (v)
000d  push 0x69 (i)
000f  push 0x6c (l)
0011  push 0x61 (a)
0013  push 0x20 ( )
0015  push 0x74 (t)
0017  push 0x75 (u)
0019  push 0x6f (o)
001b  push 0x20 ( )
001d  push 0x74 (t)
001f  push 0x69 (i)
0021  push 0x20 ( )
0023  push 0x65 (e)
0025  push 0x6b (k)
0027  push 0x61 (a)
0029  push 0x6d (m)
002b  push 0x20 ( )
002d  push 0x75 (u)
002f  push 0x6f (o)
0031  push 0x79 (y)
0033  push 0x20 ( )
0035  push 0x6e (n)
0037  push 0x61 (a)
0039  push 0x43 (C)
003b  push 0x0a ()
003d  push 0x58 (X)
003f  push 0x20 ( )
0041  push 0x49 (I)
0043  push 0x20 ( )
0045  push 0x52 (R)
0047  push 0x20 ( )
0049  push 0x54 (T)
004b  push 0x20 ( )
004d  push 0x41 (A)
004f  push 0x20 ( )
0051  push 0x4d (M)
0053  push 0x20 ( )
0055  push 0x65 (e)
0057  push 0x68 (h)
0059  push 0x74 (t)
005b  push 0x20 ( )
005d  push 0x6f (o)
005f  push 0x74 (t)
0061  push 0x20 ( )
0063  push 0x65 (e)
0065  push 0x6d (m)
0067  push 0x6f (o)
0069  push 0x63 (c)
006b  push 0x6c (l)
006d  push 0x65 (e)
006f  push 0x57 (W)
0071  push 0x013b 	; PRINT
0074  jump
; ====================================== INIT VARS
0075  push 0x01 ()  a
0077  push 0x01 ()  b
0079  push 0x00 ()  c
; ====================================== MAIN LOOP
007b  in
007c  copy
007d  push 0x75 (u)
007f  sub
0080  push 0x00a0
0083  jumpz 		; UP
0084  copy
0085  push 0x64 (d)
0087  sub
0088  push 0x00aa
008b  jumpz 		; DOWN
008c  copy
008d  push 0x6c (l)
008f  sub
0090  push 0x00b4
0093  jumpz 		; LEFT
0094  copy
0095  push 0x72 (r)
0097  sub
0098  push 0x00c0
009b  jumpz 		; RIGHT
009c  push 0x00fb 	; DEATH
009f  jump
; ====================================== UP: DEC B
00a0  pop 		; pop input
00a1  store 		; store c
00a2  push 0x01 ()
00a4  sub 		; dec b
00a5  fetch 		; fetch c
00a6  push 0x00cc
00a9  jump
; ====================================== DOWN: INC B
00aa  pop
00ab  store 		; store c
00ac  push 0x01
00ae  add 		; inc b
00af  fetch 		; fetch c
00b0  push 0x00cc
00b3  jump
; ====================================== LEFT: DEC A
00b4  pop 
00b5  store 		; store c
00b6  store 		; store b
00b7  push 0x01 ()
00b9  sub 		; dec a
00ba  fetch 		; fetch b
00bb  fetch 		; fetch c
00bc  push 0x00cc
00bf  jump
; ====================================== RIGHT: INC A
00c0  pop
00c1  store 		; store c
00c2  store 		; store b
00c3  push 0x01
00c5  add 		; inc a
00c6  fetch 		; fetch b
00c7  fetch 		; fetch c
00c8  push 0x00cc
00cb  jump
; ====================================== MAIN LOOP CONT.
00cc  store 		; store c
00cd  store 		; store b
00ce  push 0x00da
00d1  fetch 		; fetch b
00d2  copy 		; copy b
00d3  store 		; store b
00d4  push 0x10         ; push 0x10
00d6  push 0x0147
00d9  jump 		; CALL MUL(0x10, b)
00da  swap 		
00db  copy
00dc  store
00dd  add 		; (0x10 * b), a
00de  fetch 		; a
00df  swap
00e0  fetch 		; b
00e1  swap
00e2  fetch 		; c
00e3  swap
00e4  store 		; result (b * 0x10 + a)
00e5  push 0x00ef
00e8  fetch 		; result
00e9  push 0x02
00eb  push 0x0161
00ee  jump 		; CALL SHL(result, 2)
00ef  push 0x007b 	; MAIN LOOP
00f2  swap
00f3  push 0x0174 	; JUMP TABLE
00f6  add 		; table+result
00f7  jump 		; result
; ====================================== WIN
00f8  push 0x00
00fa  break
; ====================================== DEATH
00fb  push 0x0138 	; LOSE
00fe  push 0x00 ()
0100  push 0x0a ()
0102  push 0x2e (.)
0104  push 0x65 (e)
0106  push 0x75 (u)
0108  push 0x72 (r)
010a  push 0x67 (g)
010c  push 0x20 ( )
010e  push 0x61 (a)
0110  push 0x20 ( )
0112  push 0x79 (y)
0114  push 0x62 (b)
0116  push 0x20 ( )
0118  push 0x6e (n)
011a  push 0x65 (e)
011c  push 0x74 (t)
011e  push 0x61 (a)
0120  push 0x65 (e)
0122  push 0x20 ( )
0124  push 0x65 (e)
0126  push 0x72 (r)
0128  push 0x65 (e)
012a  push 0x77 (w)
012c  push 0x20 ( )
012e  push 0x75 (u)
0130  push 0x6f (o)
0132  push 0x59 (Y)
0134  push 0x013b 	; PRINT
0137  jump
; ====================================== LOSE
0138  push 0x01
013a  break
; ====================================== PRINT
013b  copy 
013c  push 0x0145
013f  jumpz
0140  out
0141  push 0x013b
0144  jump
0145  pop
0146  jump
; ======================================  MUL ARG1, ARG2
0147  push 0x00
0149  store 		; 0
014a  store 		; ARG1 (0x10)
014b  copy 		; copy ARG2 (b)
014c  push 0x015b
014f  jumpz 		; b == 0
0150  push 0x01
0152  sub 		; dec b		
0153  fetch 		; fetch ARG1
0154  copy
0155  fetch 		; fetch 0
0156  add
0157  push 0x0149
015a  jump
015b  pop 		; pop ARG2 copy
015c  fetch 		; fetch ARG1
015d  pop 		; pop ARG1
015e  fetch 		; fetch RESULT
015f  swap
0160  jump 		return
; ====================================== SHL ARG1, ARG2
0161  copy 		; copy ARG1
0162  push 0x0171 	; return
0165  jumpz 		; ARG1 == 0
0166  push 0x01
0168  sub 		; dec ARG1
0169  store 		; ARG1
016a  copy 		; copy ARG2
016b  add 		; ARG2 + ARG2
016c  fetch 		; ARG1
016d  push 0x0161 	; SHL loop
0170  jump
0171  pop 		; pop ARG1
0172  swap
0173  jump
; ====================================== JUMP TABLE
0174  push 0x00fb
0177  jump
0178  push 0x00fb
017b  jump
017c  push 0x00fb
017f  jump
0180  push 0x00fb
0183  jump
0184  push 0x00fb
0187  jump
0188  push 0x00fb
018b  jump
018c  push 0x00fb
018f  jump
0190  push 0x00fb
0193  jump
0194  push 0x00fb
0197  jump
0198  push 0x00fb
019b  jump
019c  push 0x00fb
019f  jump
01a0  push 0x00fb
01a3  jump
01a4  push 0x00fb
01a7  jump
01a8  push 0x00fb
01ab  jump
01ac  push 0x00fb
01af  jump
01b0  push 0x00fb
01b3  jump
01b4  push 0x00fb
01b7  jump
01b8  jump
01b9  nop
01ba  nop
01bb  nop
01bc  jump
01bd  nop
01be  nop
01bf  nop
01c0  jump
01c1  nop
01c2  nop
01c3  nop
01c4  jump
01c5  nop
01c6  nop
01c7  nop
01c8  jump
01c9  nop
01ca  nop
01cb  nop
01cc  push 0x057f
01cf  jump
01d0  push 0x00fb
01d3  jump
01d4  jump
01d5  nop
01d6  nop
01d7  nop
01d8  push 0x00fb
01db  jump
01dc  push 0x057f
01df  jump
01e0  jump
01e1  nop
01e2  nop
01e3  nop
01e4  jump
01e5  nop
01e6  nop
01e7  nop
01e8  push 0x00fb
01eb  jump
01ec  jump
01ed  nop
01ee  nop
01ef  nop
01f0  push 0x00fb
01f3  jump
01f4  push 0x00fb
01f7  jump
01f8  push 0x00fb
01fb  jump
01fc  push 0x00fb
01ff  jump
0200  push 0x00fb
0203  jump
0204  push 0x0574
0207  jump
0208  push 0x00fb
020b  jump
020c  push 0x00fb
020f  jump
0210  push 0x00fb
0213  jump
0214  jump
0215  nop
0216  nop
0217  nop
0218  push 0x00fb
021b  jump
021c  push 0x00fb
021f  jump
0220  push 0x00fb
0223  jump
0224  jump
0225  nop
0226  nop
0227  nop
0228  push 0x00fb
022b  jump
022c  jump
022d  nop
022e  nop
022f  nop
0230  push 0x00fb
0233  jump
0234  push 0x00fb
0237  jump
0238  jump
0239  nop
023a  nop
023b  nop
023c  jump
023d  nop
023e  nop
023f  nop
0240  jump
0241  nop
0242  nop
0243  nop
0244  jump
0245  nop
0246  nop
0247  nop
0248  jump
0249  nop
024a  nop
024b  nop
024c  jump
024d  nop
024e  nop
024f  nop
0250  jump
0251  nop
0252  nop
0253  nop
0254  jump
0255  nop
0256  nop
0257  nop
0258  jump
0259  nop
025a  nop
025b  nop
025c  jump
025d  nop
025e  nop
025f  nop
0260  push 0x00fb
0263  jump
0264  jump
0265  nop
0266  nop
0267  nop
0268  push 0x00fb
026b  jump
026c  jump
026d  nop
026e  nop
026f  nop
0270  push 0x00fb
0273  jump
0274  push 0x00fb
0277  jump
0278  push 0x00fb
027b  jump
027c  jump
027d  nop
027e  nop
027f  nop
0280  push 0x00fb
0283  jump
0284  jump
0285  nop
0286  nop
0287  nop
0288  push 0x00fb
028b  jump
028c  push 0x00fb
028f  jump
0290  push 0x00fb
0293  jump
0294  push 0x00fb
0297  jump
0298  push 0x00fb
029b  jump
029c  jump
029d  nop
029e  nop
029f  nop
02a0  push 0x00fb
02a3  jump
02a4  jump
02a5  nop
02a6  nop
02a7  nop
02a8  push 0x0574
02ab  jump
02ac  jump
02ad  nop
02ae  nop
02af  nop
02b0  push 0x00fb
02b3  jump
02b4  push 0x00fb
02b7  jump
02b8  jump
02b9  nop
02ba  nop
02bb  nop
02bc  jump
02bd  nop
02be  nop
02bf  nop
02c0  push 0x00fb
02c3  jump
02c4  jump
02c5  nop
02c6  nop
02c7  nop
02c8  push 0x00fb
02cb  jump
02cc  push 0x057f
02cf  jump
02d0  jump
02d1  nop
02d2  nop
02d3  nop
02d4  jump
02d5  nop
02d6  nop
02d7  nop
02d8  push 0x00fb
02db  jump
02dc  jump
02dd  nop
02de  nop
02df  nop
02e0  push 0x00fb
02e3  jump
02e4  jump
02e5  nop
02e6  nop
02e7  nop
02e8  push 0x00fb
02eb  jump
02ec  jump
02ed  nop
02ee  nop
02ef  nop
02f0  push 0x00fb
02f3  jump
02f4  push 0x00fb
02f7  jump
02f8  jump
02f9  nop
02fa  nop
02fb  nop
02fc  push 0x00fb
02ff  jump
0300  push 0x00fb
0303  jump
0304  jump
0305  nop
0306  nop
0307  nop
0308  push 0x00fb
030b  jump
030c  push 0x00fb
030f  jump
0310  push 0x00fb
0313  jump
0314  jump
0315  nop
0316  nop
0317  nop
0318  push 0x00fb
031b  jump
031c  jump
031d  nop
031e  nop
031f  nop
0320  push 0x00fb
0323  jump
0324  jump
0325  nop
0326  nop
0327  nop
0328  push 0x00fb
032b  jump
032c  jump
032d  nop
032e  nop
032f  nop
0330  push 0x00fb
0333  jump
0334  push 0x00fb
0337  jump
0338  jump
0339  nop
033a  nop
033b  nop
033c  push 0x00fb
033f  jump
0340  jump
0341  nop
0342  nop
0343  nop
0344  jump
0345  nop
0346  nop
0347  nop
0348  jump
0349  nop
034a  nop
034b  nop
034c  jump
034d  nop
034e  nop
034f  nop
0350  jump
0351  nop
0352  nop
0353  nop
0354  jump
0355  nop
0356  nop
0357  nop
0358  push 0x00fb
035b  jump
035c  jump
035d  nop
035e  nop
035f  nop
0360  push 0x00fb
0363  jump
0364  jump
0365  nop
0366  nop
0367  nop
0368  push 0x00fb
036b  jump
036c  jump
036d  nop
036e  nop
036f  nop
0370  push 0x00fb
0373  jump
0374  push 0x00fb
0377  jump
0378  jump
0379  nop
037a  nop
037b  nop
037c  push 0x00fb
037f  jump
0380  jump
0381  nop
0382  nop
0383  nop
0384  push 0x00fb
0387  jump
0388  push 0x00fb
038b  jump
038c  push 0x00fb
038f  jump
0390  push 0x00fb
0393  jump
0394  push 0x00fb
0397  jump
0398  push 0x00fb
039b  jump
039c  jump
039d  nop
039e  nop
039f  nop
03a0  push 0x00fb
03a3  jump
03a4  jump
03a5  nop
03a6  nop
03a7  nop
03a8  push 0x00fb
03ab  jump
03ac  jump
03ad  nop
03ae  nop
03af  nop
03b0  push 0x00fb
03b3  jump
03b4  push 0x00fb
03b7  jump
03b8  jump
03b9  nop
03ba  nop
03bb  nop
03bc  push 0x00fb
03bf  jump
03c0  jump
03c1  nop
03c2  nop
03c3  nop
03c4  jump
03c5  nop
03c6  nop
03c7  nop
03c8  jump
03c9  nop
03ca  nop
03cb  nop
03cc  jump
03cd  nop
03ce  nop
03cf  nop
03d0  jump
03d1  nop
03d2  nop
03d3  nop
03d4  jump
03d5  nop
03d6  nop
03d7  nop
03d8  jump
03d9  nop
03da  nop
03db  nop
03dc  jump
03dd  nop
03de  nop
03df  nop
03e0  push 0x00fb
03e3  jump
03e4  jump
03e5  nop
03e6  nop
03e7  nop
03e8  push 0x00fb
03eb  jump
03ec  jump
03ed  nop
03ee  nop
03ef  nop
03f0  push 0x00fb
03f3  jump
03f4  push 0x00fb
03f7  jump
03f8  jump
03f9  nop
03fa  nop
03fb  nop
03fc  push 0x00fb
03ff  jump
0400  push 0x00fb
0403  jump
0404  push 0x00fb
0407  jump
0408  jump
0409  nop
040a  nop
040b  nop
040c  push 0x00fb
040f  jump
0410  push 0x00fb
0413  jump
0414  push 0x00fb
0417  jump
0418  push 0x00fb
041b  jump
041c  push 0x00fb
041f  jump
0420  push 0x00fb
0423  jump
0424  jump
0425  nop
0426  nop
0427  nop
0428  push 0x00fb
042b  jump
042c  jump
042d  nop
042e  nop
042f  nop
0430  push 0x00fb
0433  jump
0434  push 0x00fb
0437  jump
0438  jump
0439  nop
043a  nop
043b  nop
043c  jump
043d  nop
043e  nop
043f  nop
0440  jump
0441  nop
0442  nop
0443  nop
0444  push 0x00fb
0447  jump
0448  jump
0449  nop
044a  nop
044b  nop
044c  jump
044d  nop
044e  nop
044f  nop
0450  push 0x0574
0453  jump
0454  jump
0455  nop
0456  nop
0457  nop
0458  jump
0459  nop
045a  nop
045b  nop
045c  push 0x00fb
045f  jump
0460  jump
0461  nop
0462  nop
0463  nop
0464  jump
0465  nop
0466  nop
0467  nop
0468  push 0x00fb
046b  jump
046c  jump
046d  nop
046e  nop
046f  nop
0470  push 0x00fb
0473  jump
0474  push 0x00fb
0477  jump
0478  jump
0479  nop
047a  nop
047b  nop
047c  push 0x00fb
047f  jump
0480  push 0x00fb
0483  jump
0484  push 0x00fb
0487  jump
0488  jump
0489  nop
048a  nop
048b  nop
048c  jump
048d  nop
048e  nop
048f  nop
0490  push 0x00fb
0493  jump
0494  jump
0495  nop
0496  nop
0497  nop
0498  jump
0499  nop
049a  nop
049b  nop
049c  push 0x00fb
049f  jump
04a0  jump
04a1  nop
04a2  nop
04a3  nop
04a4  push 0x00fb
04a7  jump
04a8  jump
04a9  nop
04aa  nop
04ab  nop
04ac  jump
04ad  nop
04ae  nop
04af  nop
04b0  push 0x00fb
04b3  jump
04b4  push 0x00fb
04b7  jump
04b8  jump
04b9  nop
04ba  nop
04bb  nop
04bc  push 0x00fb
04bf  jump
04c0  jump
04c1  nop
04c2  nop
04c3  nop
04c4  jump
04c5  nop
04c6  nop
04c7  nop
04c8  jump
04c9  nop
04ca  nop
04cb  nop
04cc  push 0x00fb
04cf  jump
04d0  push 0x00fb
04d3  jump
04d4  push 0x00fb
04d7  jump
04d8  jump
04d9  nop
04da  nop
04db  nop
04dc  push 0x00fb
04df  jump
04e0  jump
04e1  nop
04e2  nop
04e3  nop
04e4  push 0x00fb
04e7  jump
04e8  push 0x0574
04eb  jump
04ec  push 0x00fb
04ef  jump
04f0  push 0x00fb
04f3  jump
04f4  push 0x00fb
04f7  jump
04f8  jump
04f9  nop
04fa  nop
04fb  nop
04fc  push 0x00fb
04ff  jump
0500  jump
0501  nop
0502  nop
0503  nop
0504  jump
0505  nop
0506  nop
0507  nop
0508  jump
0509  nop
050a  nop
050b  nop
050c  jump
050d  nop
050e  nop
050f  nop
0510  push 0x00fb
0513  jump
0514  jump
0515  nop
0516  nop
0517  nop
0518  jump
0519  nop
051a  nop
051b  nop
051c  push 0x0574
051f  jump
0520  jump
0521  nop
0522  nop
0523  nop
0524  push 0x00fb
0527  jump
0528  jump
0529  nop
052a  nop
052b  nop
052c  jump
052d  nop
052e  nop
052f  nop
0530  push 0x00fb
0533  jump
0534  push 0x00fb
0537  jump
0538  push 0x00fb
053b  jump
053c  push 0x00fb
053f  jump
0540  push 0x00fb
0543  jump
0544  push 0x00fb
0547  jump
0548  push 0x00fb
054b  jump
054c  push 0x00fb
054f  jump
0550  push 0x00fb
0553  jump
0554  push 0x00fb
0557  jump
0558  push 0x00fb
055b  jump
055c  push 0x00fb
055f  jump
0560  push 0x00fb
0563  jump
0564  push 0x00fb
0567  jump
0568  push 0x00fb
056b  jump
056c  push 0x0585
056f  jump
0570  push 0x00fb
0573  jump
; ====================================== DEC C
0574  store
0575  copy
0576  push 0x00fb 	; DEATH
0579  jumpz 		; c == 0
057a  push 0x01
057c  sub 		; dec c
057d  fetch
057e  jump
; ====================================== INC C
057f  store
0580  push 0x01
0582  add 		; inc c
0583  fetch
0584  jump
; ====================================== SUCCESS
0585  pop
0586  pop
0587  pop
0588  pop
0589  push 0x05ce
058c  push 0x00 ()
058e  push 0x0a ()
0590  push 0x21 (!)
0592  push 0x74 (t)
0594  push 0x69 (i)
0596  push 0x20 ( )
0598  push 0x65 (e)
059a  push 0x64 (d)
059c  push 0x61 (a)
059e  push 0x6d (m)
05a0  push 0x20 ( )
05a2  push 0x75 (u)
05a4  push 0x6f (o)
05a6  push 0x79 (y)
05a8  push 0x20 ( )
05aa  push 0x2c (,)
05ac  push 0x73 (s)
05ae  push 0x6e (n)
05b0  push 0x6f (o)
05b2  push 0x69 (i)
05b4  push 0x74 (t)
05b6  push 0x61 (a)
05b8  push 0x6c (l)
05ba  push 0x75 (u)
05bc  push 0x74 (t)
05be  push 0x61 (a)
05c0  push 0x72 (r)
05c2  push 0x67 (g)
05c4  push 0x6e (n)
05c6  push 0x6f (o)
05c8  push 0x43 (C)
05ca  push 0x013b 	; PRINT
05cd  jump
05ce  push 0x00f8 	; WIN
05d1  jump
