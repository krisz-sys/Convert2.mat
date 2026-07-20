function t=convert2period(s,lasts)
max=length(s);
str=s(1:2)+":"+s(4:5)+":"+s(7:8)+"."+s(10:max);
max=length(lasts);
last=lasts(1:2)+":"+lasts(4:5)+":"+lasts(7:8)+"."+lasts(10:max);
t1=datenum(str, 'HH:MM:SS.FFF');
t2=datenum(last, 'HH:MM:SS.FFF');
t=abs((t1-t2)*(24*60*60));