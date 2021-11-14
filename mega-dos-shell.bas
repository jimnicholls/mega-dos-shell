   10 scnclr:print"mega dos shell - alpha 1"
   20 print"1. directory browser":print"2. track editor":inputa
   30 onagoto200,100
   40 goto10
  100 scnclr:cursor56,0:input"track";t:cursor67,0:input"block";b
  110 cursor56,0:printchr$(27);"qtrack";t:cursor67,0:print"block";b
  120 open15,8,15:p=$40000:gosub500
  130 ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  140 fory=5to20:cursor5,y:gosub160:print"  ";:gosub160:next
  150 close15:end
  160 forx=0to7:printright$(hex$(peek(p)),2)" ";:p=p+1:next:return
  200 scnclr:dimft$(7):restore220
  210 forx=0to7:readft$(x):next
  220 datadel,seq,prg,usr,rel,cbm,?,?
  230 open15,8,15:t=40:b=0:p=$40000:gosub500
  240 ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  250 cursor2,0:print"u8 virt";:cursor12,0
  260 forx=0to15:printchr$(peek(p+4+x));:next:cursor30,0
  270 forx=0to1:printchr$(peek(p+22+x));:next:cursor33,0
  280 forx=0to1:printchr$(peek(p+25+x));:next
  290 b=3
  300 do:cursor0,24:print"block ";:printusing"##";b;:window1,2,37,22,1:print"{home}{home}";
  310 gosub500:ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  320 fory=0to7:o=p+32*y+2:cursor5,2+y:printusing"####";peekw(o+28):cursor12,2+y
  330 forx=0to15:printchr$(peek(o+3+x));:next:cursor32,y+2:printft$(peek(o+0)and7);
  340 next
  350 getkeya&
  360 ifa&=43andb<39thenb=b+1
  370 ifa&=45andb>3thenb=b-1
  380 loop
  390 close15:end
  500 close5:open5,8,5,"#":print#15,"u1";5;0;t;b
  510 a=ds:ifa<>0thenclose5:return
  520 forx=ptop+255:get#5,a$:ifa$=""thenpokex,0:elsepokex,asc(a$):nextx
  530 close5:return
65000 n$="mega dos shell":iflen(n$)>15thenprint"filename is too long":stop
65010 dopen#1,"last version":ifds=0theninput#1,a:elsea=0
65020 dclose#1:ifa<9thena=a+1:elsea=1
65030 a$=mid$(str$(a),2)
65040 v$=n$+a$:print"saving 0:"v$:erase(v$):dsave(v$):dverify(v$)
65050 print"saving 0:"n$:erase(n$):copy(v$)to(n$)
65060 erase"last version":dopen#1,"last version",w:print#1,a:dclose#1
65070 end
