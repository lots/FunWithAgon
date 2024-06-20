   10 REM Simple Font Loader
   20 REM Original by EIGHTBITSWIDE; modified by CCW
   30 :
   40 REM RED= COLOUR 1
   50 REM GREEN=COLOUR 2
   60 REM YELLOW=COLOUR 3
   70 REM BLUE=COLOUR 4
   80 REM MAGENTA=COLOUR 5
   90 REM CYAN=COLOUR 6
  100 REM WHITE=COLOUR 7
  110 REM GREY=COLOUR 8
  120 REM BrightWHITE=COLOUR 15
  130 :
  140 REM MODE 3 : PRINT : COLOUR 128+2 : COLOUR 15 : CLS : REM MODE 3 - 640x240,64c
  150 MODE 3 : PRINT : COLOUR 128+2 : COLOUR 15 : CLS
  160 infile=OPENIN "burnin_rubber.64c" : REM infile=OPENIN "/Resources/burnin_rubber.64c"
  170 toss=BGET#infile : toss2=BGET#infile
  180 COLOUR 8 : PRINT TAB(3)"Analyzing RAW binary data on the AgonLight-2"
  190 FOR x = 96 TO 126
  200   cb1=BGET#infile : ch1$=CHR$(cb1)
  210   cb2=BGET#infile : ch2$=CHR$(cb2)
  220   cb3=BGET#infile : ch3$=CHR$(cb3)
  230   cb4=BGET#infile : ch4$=CHR$(cb4)
  240   cb5=BGET#infile : ch5$=CHR$(cb5)
  250   cb6=BGET#infile : ch6$=CHR$(cb6)
  260   cb7=BGET#infile : ch7$=CHR$(cb7)
  270   cb8=BGET#infile : ch8$=CHR$(cb8)
  280   VDU 23,x,ASC(ch1$),ASC(ch2$),ASC(ch3$),ASC(ch4$),ASC(ch5$),ASC(ch6$),ASC(ch7$),ASC(ch8$)
  290   COLOUR 4
  295   PRINT
  300   PRINT "["+FN_getBits(cb1)+"]"
  301   PRINT "["+FN_getBits(cb2)+"]"
  302   PRINT "["+FN_getBits(cb3)+"]"
  303   PRINT "["+FN_getBits(cb4)+"]"
  304   PRINT "["+FN_getBits(cb5)+"]"
  305   PRINT "["+FN_getBits(cb6)+"]"
  306   PRINT "["+FN_getBits(cb7)+"]"
  307   PRINT "["+FN_getBits(cb8)+"]"
  310   REM PRINT CHR$(cb1)CHR$(cb2)CHR$(cb3)CHR$(cb4)CHR$(cb5)CHR$(cb6)CHR$(cb7)CHR$(cb8)
  320   PRINT " " CHR$(x) " ";
  330   COLOUR 3
  340   PRINT STR$(x)
  345   REM COLOUR 5:COLOUR 128:PRINT " ";STR$(ASC(ch1$)),ASC(ch2$),ASC(ch3$),ASC(ch4$),ASC(ch5$),ASC(ch6$),ASC(ch7$),ASC(ch8$):COLOUR 128+2
  347   COLOUR 5:COLOUR 128
  348   PRINT "  "+STR$(ASC(ch1$))+"  "+STR$(ASC(ch2$))+"  "+STR$(ASC(ch3$))+"  "+STR$(ASC(ch4$))+"  "+STR$(ASC(ch5$))+"  "+STR$(ASC(ch6$))+"  "+STR$(ASC(ch7$))+"  "+STR$(ASC(ch8$))+"  ";
  349   COLOUR 128+2
  350   key$=GET$
  370 NEXT x
  380 PRINT
  390 CLOSE#infile
  395 key$=GET$
  400 MODE 3 : REM COLOUR 1
  410 PRINT "READY."
  420 END
  430 :
  440 DEF FN_getBits(var%)
  450 LOCAL R$, R%, T%
  460 T%=var%
  470 REPEAT
  475   R% = T% MOD 2
  480   REM R$ = STR$(T% MOD 2) + R$
  485   IF R% = 1 THEN R$ = "@" + R$ ELSE R$ = "." + R$
  490   T% = T% DIV 2
  500 UNTIL NOT(T%>0)
  510 IF LEN(R$)<>8 THEN R$=STRING$((8-LEN(R$)),".") + R$
  520 =R$
  530 :
