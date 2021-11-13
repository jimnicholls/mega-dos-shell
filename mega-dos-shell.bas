   10 scnclr:print"mega dos shell - alpha 1"
   20 print"1. directory browser":print"2. track editor":inputa
   30 onagoto200,100
   40 goto10
  100 scnclr:cursor56,0:input"track";t:cursor67,0:input"block";b
  110 open15,8,15:open5,8,5,"#":print#15,"u1";5;0;t;b
  115 ifds<>0thencursor0,2:foreground2:printds$:foreground1:stop
  120 fory=5to20
  130 forx=5to26step3:get#5,a$:ifa$=""thena$="00":elsea$=right$(hex$(asc(a$)),2)
  135 cursorx,y:printa$;:next
  140 forx=31to53step3:get#5,a$:ifa$=""thena$="00":elsea$=right$(hex$(asc(a$)),2)
  145 cursorx,y:printa$;:next
  150 next
  160 close5:close15
  170 end
  200 scnclr
  210 open15,8,15:dimb&(255):t=40:b=0:gosub500
  220 ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  230 cursor2,0:print"u8 virt";:cursor12,0
  240 forx=0to15:printchr$(b&(4+x));:next:cursor30,0
  250 forx=0to1:printchr$(b&(22+x));:next:cursor33,0
  260 forx=0to1:printchr$(b&(25+x));:next
  270 b=3
  280 do:cursor0,24:print"block ";:printusing"##";b;:window1,2,37,22,1:print"{home}{home}";
  290 gosub500:ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  300 fory=0to7:o=32*y+2:cursor5,2+y:printusing"####";b&(o+28)+b&(o+29)*256:cursor12,2+y
  310 forx=0to15:printchr$(b&(o+3+x));:next:cursor32,y+2:fgoto320+(b&(o+0)and7)*10
  320 print"del";:goto380
  330 print"seq";:goto380
  340 print"prg";:goto380
  350 print"usr";:goto380
  360 print"rel";:goto380
  370 print"cbm";:goto380
  380 next
  390 getkeya&
  400 ifa&=43andb<39thenb=b+1
  410 ifa&=45andb>3thenb=b-1
  420 loop
  430 close15:end
  500 close5:open5,8,5,"#":print#15,"u1";5;0;t;b
  510 a=ds:ifa<>0thenclose5:return
  520 forx=0to255:get#5,a$:ifa$=""thenb&(x)=0:elseb&(x)=asc(a$):nextx
  530 close5:return
65000 n$="mega dos shell":iflen(n$)>15thenprint"filename is too long":stop
65010 dopen#1,"last version":ifds=0theninput#1,a:elsea=0
65020 dclose#1:ifa<9thena=a+1:elsea=1
65030 a$=mid$(str$(a),2)
65040 v$=n$+a$:print"saving 0:"v$:erase(v$):dsave(v$):dverify(v$)
65050 print"saving 0:"n$:erase(n$):copy(v$)to(n$)
65060 erase"last version":dopen#1,"last version",w:print#1,a:dclose#1
65070 end
