   10 gosub9000:scnclr:print"mega dos shell - alpha 1"
   20 print"1. directory browser":print"2. track editor":print"3. bam editor":inputa
   30 onagoto100,2000,4000
   40 goto10
  100 scnclr:dimft$(7):restore120
  110 forx=0to7:readft$(x):next
  120 datadel,seq,prg,usr,rel,cbm,?,?
  130 t=40:b=0:p=$40000:gosub6000
  140 ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  150 cursor2,0:print"u9 virt";:cursor12,0
  160 forx=0to15:printchr$(peek(p+4+x));:next:cursor30,0
  170 forx=0to1:printchr$(peek(p+22+x));:next:cursor33,0
  180 forx=0to1:printchr$(peek(p+25+x));:next
  190 b=3
  200 do:cursor0,24:print"block ";:printusing"##";b;:window1,2,37,22,1:print"{home}{home}";
  210 gosub6000:ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
  220 fory=0to7:o=p+32*y+2:cursor5,2+y:printusing"####";peekw(o+28):cursor12,2+y
  230 forx=0to15:printchr$(peek(o+3+x));:next:cursor32,y+2:printft$(peek(o+0)and7);
  240 next
  250 getkeya&
  260 ifa&=43andb<39thenb=b+1
  270 ifa&=45andb>3thenb=b-1
  280 loop
  290 close15:end
 2000 scnclr:cursor56,0:input"track";t:cursor67,0:input"block";b
 2010 cursor56,0:printchr$(27);"qtrack";t:cursor67,0:print"block";b
 2020 p=$40000:gosub6000
 2030 ifa<>0thencursor0,2:foreground2:printds$:foreground1:stop
 2040 fory=5to20:cursor5,y:gosub2060:print"  ";:gosub2060:next
 2050 close15:end
 2060 forx=0to7:printright$(hex$(peek(p)),2)" ";:p=p+1:next:return
 4000 scnclr:gosub4900:gosub4800:close15:window2,4,79,23:tr=1:gosub4500
 4010 do:getkeya&
 4020 ifa&=43thengosub4100
 4030 ifa&=45thengosub4150
 4040 loop
 4100 tr=tr+20:iftr>21thentr=21
 4110 gosub4500:return
 4150 tr=tr-20:iftr<1thentr=1
 4160 gosub4500:return
 4500 scnclr:foreground15:printchr$(27)"m";:printusing"{rvon}##{rvof}";tr
 4510 fory=tr+1totr+19:a=mod(y,10):ifa=0thena=y
 4520 printusing"{rvon}##";a:next:foreground1
 4530 fory=trtotr+19:p=$40100+(y-1)*40:printspc(2);:gosub4600:printspc(1);:gosub4600:print:next
 4540 printchr$(27);"l";:return
 4600 forx=0to19:a=peek(p):p=p+1:ifa=0thenprint"Q";:elseprint".";
 4610 next:return
 4800 t=40:b=1:p=$40000:gosub6000:ifa<>0thenstop
 4810 p=p+16:x=$40100:edma3,$c80,$ff,x
 4820 fort=0to39:p=p+1
 4830 fory=0to4:a=peek(p):p=p+1
 4840 forz=0to7:poke(x),aand1:x=x+1:a=int(a/2):next:next:next
 4850 return
 4900 foreground24:cursor59,0:print"block allocation map"
 4910 foreground14:cursor4,1:print"block"
 4920 foreground15:cursor4,2:print"{rvon}0         1         {rvof} {rvon}2         3         "
 4930 cursor4,3:print"{rvon}01234567890123456789{rvof} {rvon}01234567890123456789"
 4940 foreground14:cursor0,4:print"t{down}{left}r{down}{left}a{down}{left}c{down}{left}k"
 4950 foreground1:cursor5,24:print".";:cursor13,24:print"Q";:foreground24:cursor7,24:print"free";:cursor15,24:print"allocated";
 4960 t=40:b=0:p=$40000:gosub6000:ifa<>0thenstop
 4970 cursor2,0:print"u9 virt";:cursor12,0
 4980 forx=0to15:printchr$(peek(p+4+x));:next:cursor30,0:printchr$(peek(p+22))chr$(peek(p+23));:cursor33,0:printchr$(peek(p+25))chr$(peek(p+26));
 4990 foreground1:return
 6000 close5:close15:open15,9,15:open5,9,5,"#":print#15,"u1";5;0;t;b
 6010 a=ds:ifa<>0then6030
 6020 forx=ptop+255:get#5,a$:ifa$=""thenpokex,0:elsepokex,asc(a$):nextx
 6030 close5:close15:return
 7500 if(sb&(0)=d)and(sb&(1)=t)and(sb&(2)=x)and(sb&(3)=s)thena=0:return
 7510 gosub7600:ifa<>0thenreturn
 7520 gosub7800:ifa<>0thenreturn
 7530 ifx=1thenpoke$d080,peek($d080)or8
 7540 poke$d084,t:poke$d085,s:poke$d086,x:poke$d081,$40:wait$d082,$80,$80
 7550 a=peek($d082):if(aand28)=0thena=0:sb&(0)=d:sb&(1)=t:sb&(2)=x:sb&(3)=s:return
 7560 if(aand16)>0thena=1:elseif(aand8)>0thena=2:elsea=3
 7570 return
 7600 ifht&(d)=tthena=0:return
 7610 ifht&(d)=255thengosub7700:elsegosub7800
 7620 ifa<>0thenreturn
 7630 dowhileht&(d)<>t
 7640 ift<ht&(d)thenpoke$d081,$10:ht&(d)=ht&(d)-1:elsepoke$d081,$18:ht&(d)=ht&(d)+1
 7650 wait$d082,$80,$80:loop:return
 7700 gosub7800:ifa<>0thenreturn
 7710 dowhilenotpeek($d082)and1:poke$d081,$10:wait$d082,$80,$80:loop:ht&(d)=0:return
 7800 if(peek($d080)and$27)=($20ord)thena=0:return
 7810 poke$d080,$20ord:poke$d081,$20:wait$d082,$80,$80
 7820 if(peek($d083)and8)>0thena=0:return:elsea=4:goto7850
 7850 poke$d080,d:return
 9000 dimht&(7),sb&(3)
 9010 fori=0to7:ht&(i)=255:next
 9020 fori=0to3:ht&(i)=255:next
 9030 return
65000 n$="mega dos shell":iflen(n$)>15thenprint"filename is too long":stop
65010 dopen#1,"last version":ifds=0theninput#1,a:elsea=0
65020 dclose#1:ifa<9thena=a+1:elsea=1
65030 a$=mid$(str$(a),2)
65040 v$=n$+a$:print"saving 0:"v$:erase(v$):dsave(v$):dverify(v$)
65050 print"saving 0:"n$:erase(n$):copy(v$)to(n$)
65060 erase"last version":dopen#1,"last version",w:print#1,a:dclose#1
65070 end
