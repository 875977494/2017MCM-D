%main.m

% B = ��������
% L = ����������е�����
% iterations = ���������棩����
% Arrival =  �����ƽ��������
% checklength =
% Service1 = A���ڵķ���Ч��
% Service22 = B����preЧ��
% Service2 = B���ڳ���Ч��
% check = check matrix  1=�ÿ� 0=empty -1=forbid -3=����
% v = velocity matrix
% vmax = max speed of �ÿ�
% time = time matrix
% dt = time step 
% t_h = time factor ����ʱ������
% scount =  ��ģ�����뿪���������ˣ�����c��d��
% ttime = ����ʱ��
% influx = influx vector
% outflux = outflux vector
% timecost = time cost of ȫ���ÿ�
% h = handle of the graphics

clear
clc
iterations = 2000;  %ѭ������
B = 4;              %����Ϊ4
L = 4;
checklength = 70;   %����Ϊ70
[check,v,time]=create_check(B,L,checklength);  %����create_check����
h=show_check(check,NaN,0.01);        %����show_check����

dt=1; %0.2
t_h=2;
vmax=2;
timecost=[];
for i=1:iterations
    Service1=poissrnd(0.13);
    Service2=poissrnd(0.13);
    Arrival=10;
[check,v,arrivalscount]=new_people(Arrival,dt,check,v,vmax);

h=show_check(check,h,0.02);

% rules
[check,v,time]=switch_lanes(check,v,time);
[check,v,time]=move_forward(Service1,Service2,dt,B,check, v, time, vmax);
[check,v,time,scount,ttime,sscount]=clear_boundary(B,check,v,time);
%flux calculations
influx(i)=arrivalscount;
outflux(i)=scount;
timecost=[timecost,ttime];
influxx(i)=sscount;
end
sumin=sum(influx);
sumout=sum(outflux);
sumpre=sum(influxx);
per=sumout/sumin;
newper=sumpre/sumout;
va=max(timecost)-round(mean(timecost));
h = show_check(check, h, 0.01);
title({strcat('B=',num2str(B))})
xlabel({strcat('in=',num2str(sumin)),...
    strcat('out=',num2str(sumout)),...
    strcat('pre=',num2str(sumpre)),...
    strcat('r1=',num2str(per)),...
    strcat('r2=',num2str(newper)),...
    strcat('va=',num2str(va)),...
    strcat('time = ', num2str(round(mean(timecost))))})%,'Rotation',270)
%set(get(gca,'xlabel'),'position',[12 76 110])