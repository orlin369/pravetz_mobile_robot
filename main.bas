10 REM
20 OL = -16296
30 DIM D(20): A = 0
40 C = 0: DIM M(20): PS = 0: PC = 0
50 GOSUB 550
60 HOME
70 PRINT "UPRAVLENIE NA ROBOT."
80 PRINT
90 PRINT "KAJI KAKVO DA PRAVYA:"
100 PRINT "2. START"
110 PRINT "3. IZTRIVANE NA PAMETTA"
120 PRINT
130 PRINT "VAVEDETE CHISLO"
140 INPUT C
150 IF C < 1 OR C > 3 THEN 130
160 ON C GOSUB 180,440,550
170 GOTO 60
180 PC = PS
190 HOME
200 IF PC = 20 THEN 390
210 PRINT
220 PRINT "ZADAJTE STYPKA NOMER: "; PC
230 PRINT "POSOKA, POSLE VREME."
240 INPUT M$(PC)
250 IF M$(PC)="S" THEN 410
260 INPUT D(PC)
270 P1 = 999
280 GOSUB 580
290 IF P1 <> 999 AND D(PC) > 0 THEN 320
300 PRINT "GRESHNA KOMANDA"
310 GOTO 220
320 GOSUB 630
330 HOME
340 FOR I = 1 TO PC
350 PRINT "STYPKA";I;": ";M$(1);" ";D(I)
360 NEXT I
370 PC = PC+I
380 GOTO 200
390 PRINT "NYAMA POVECHE STYPKI"
400 M$(PC)="S"
410 PS = PC
420 GOSUB 710
430 RETURN
440 HOME
450 PC = 1
460 PRINT "STYPKA";PC;": ";M$(PC);" ";D (PC)
470 IF M$(PC)="C" THEN 520
480 GOSUB 580
490 GOSUB 630
500 PC = PC+1
510 GOTO 460
520 PRINT "KRAI NA INSTRUKCIITE"
530 GOSUB 710
540 RETURN
550 M$(1)="C"
560 PS = 1
570 RETURN
580 IF M$(PC)="W" THEN P1 = 1: P2 = 5
590 IF M$(PC)="A" THEN P1 = 0: P2 = 4
600 IF M$(PC)="D" THEN P1 = 1: P2 = 4
610 IF M$(PC)="S" THEN P1 = 0: P2 = 5
620 RETURN
630 A = PEEK(OL+P1): A = PEEK(OL+P2): A = PEEK(OL+3)
640 FOR J = 1 TO D(PC)
650 FOR L = 1 TO 600
660 NEXT L
670 A = PEEK(-16384): IF A = 243 THEN A = PEEK(49168): GOTO 740
680 NEXT J
690 A = PEEK(OL+2): REM STOP
700 RETURN
710 PRINT "NATISNETE RETURN ZA MENUTO"
720 INPUT Z$ 
730 RETURN
740 A = PEEK(OL+2): REM STOP
750 END 
