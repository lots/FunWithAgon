    5 CLS
   10 *FX 12 33: REM sets keyboard repeat rate
   20 PRINT"Enter the system date and time."
   30 INPUT"Year:"year
   40 INPUT"Month:"month
   50 INPUT"Day:"day
   60 INPUT"Hour:"hour
   70 INPUT"Minutes:"minutes
   80 INPUT"Seconds:"seconds
   90 REM OSCLI("TIME " + STR$(year)) + " " + STR$(month) + " " + STR$(day) + " " + STR$(hour) + " " + STR$(minutes) + " " + STR$(seconds))
  100 INPUT"Select a Screen MODE from 0 to 18 or 129 to 143";mode
  110 INPUT"Select a background COLOUR from 128 to 191 (143-WHITE)";bg
  120 INPUT"Select a foreground COLOUR from o to 63 (22-LIGHT BLUE)";fg
  125 IF ASC$(fg)=195 THEN fg=15: REM if just press <ENTER> then fg will be 195
  130 MODE mode
  140 W%=FN_getWordVDP(&0F)
  150 H%=FN_getWordVDP(&11)
  160 C%=FN_getByteVDP(&13)
  170 R%=FN_getByteVDP(&14)
  180 D%=FN_getByteVDP(&15)
  190 COLOUR bg
  200 COLOUR fg
  210 : TW = 40 : REM Title width
  212 S01$="*** AGON LIGHT 2 MICRO COMPUTER ***"
  214 S02$="Agon Console8 MOS Version 2.2.3"
  216 S03$="Agon Console8 VDP Version 2.8.1"
  218 S04$="BBC BASIC (Agon) Version 1.6"
  220 S05$="eZ80 CPU "+STR$(HIMEM-LOMEM)+" BASIC bytes free"
  222 S06$="MODE "+STR$(mode)+": "+STR$(C%)+" cols x "+STR$(R%)+" rows"  :  REM S06$="MODE "+STR$(mode)+": "+C%+" cols x "+R%+" rows"
  224 S07$="Background color: " : REM S07$="Background color: "+STR$(bg)
  226 S08$="Foreground color: "+STR$(fg)
  228 S09$="No. of colors: "+STR$(D%)
  270 CLS
  272 COLOUR 9:REM Red ink
  274 PRINT TAB((TW-LEN(S01$))/2,0)S01$
  276 COLOUR 8:REM Grey ink
  278 PRINT TAB((TW-LEN(S02$))/2,1)S02$+" ";:PROC_rainbow_print("Rainbow"):COLOUR 8
  280 PRINT TAB((TW-LEN(S03$))/2,2)S03$
  282 PRINT TAB((TW-LEN(S04$))/2,3)S04$
  284 PRINT TAB((TW-LEN(S05$))/2,4)S05$
  286 PRINT TAB((TW-LEN(S06$))/2,5)S06$
  288 PRINT TAB((TW-LEN(S07$))/2,6)S07$
  290 PRINT TAB((TW-LEN(S08$))/2,7)S08$
  292 PRINT TAB((TW-LEN(S09$))/2,8)S09$
  294 PRINT TAB((TW-24)/2,9)"";:COLOUR 6 :*TIME
  295 REM PRINT TAB(9,9)"DATE/TIME: ";*TIME
  298 COLOUR fg
  300 PRINT"READY."
  310 :
  320 NEW
  330 END
  340 :
  350 DEF FN_getByteVDP(var%)
  360 A%=&A0
  370 L%=var%
  380 =USR(&FFF4)
  390 :
  400 DEF FN_getWordVDP(var%)
  410 =FN_getByteVDP(var%)+256*FN_getByteVDP(var%+1)
  490 :
  500 DEF PROC_rainbow_print(var$)
  502    FOR I=1 TO LEN(var$)
  504       VDU 17,(I MOD 8 + 8)
  506       PRINT MID$(var$,I,1);
  508    NEXT I
  590 ENDPROC
