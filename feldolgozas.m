clc;
close all;
clear all;
% This code filters, plots, and saves a previously measured signal into a .mat file.

file='furdo.txt';

fid = fopen(file);
line = fgetl(fid);
hour=line(1:2);
minute=line(4:5);
second=line(7:8);
hour=3600*str2double(hour);
minute=60*str2double(minute);
second=str2double(second);
t=hour+minute+second;               % null time

lasttime=split(line,"    ");
x=[];

linenum=1;
while ischar(line)
    line = fgetl(fid);
    if ischar(line)
    linenum=linenum+1;;
    s=[];
    if line(end-2)=='.'
        s=[line(end-4)+""+line(end-3)+"."+line(end-1)+""+line(end)];
    else
        s=[line(end-3)+""+line(end-2)+"."+line(end)];
    end
    a=str2double(s);
    x=[x a];
    time=split(line,"    ");
    period=convert2period(time{1},lasttime{1});
    if period>15
        period=6;
    end
    next=t(end)+period;
    t=[t next];
    disp("   ");
    lasttime=time;
    else
        break;
    end
end
t=t(1:(end-1));
filtered=x;
n=1;

subplot(n,1,1);
plot(t,filtered);

save('test.mat','t','filtered')