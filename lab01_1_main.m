
function lab01_main
%=== ���������:������ ������� ��������� ���������� ===
%--- ����������� ������ #1 ����������� ���������� ������� ---
%
% �������������� ����� �����: 
% pec1.dat - ������ ���, ��� �� ����������� ������
%
% ������� ����������� (m-�����), �� ��������� ���������:
% pks = pksdetect(�) - ����������� ��� � ����������� ������
%--------------------------------------------------------------------

clear, clc, close all
disp('����������� ������ #1')
disp('����������� ���������� �������')
disp('�������:C������� �. �., ����� ��-461 ����') 

%=== �������� #1.1 ===
% ����������� ���������� ��������
N = 12 ; % 12 ������
n = 0:N-1 ;%������ ��������� �� � 0, � � 1
x1 =double(n==0); %��� �1
x2 =double(n==2); %��� �2
 
figure(1)
subplot(2,1,1 ), stem(x1 ), %2-��-��� ����� 1-���-��� ������� 1-������ ������
subplot(2,1,2 ), stem(x2 ), 

%%
%=== �������� #1.2 === 
% ����������� ����������� �������
x = 0:4:200; %0-������� 200-����  4- ������� ����� 
y=cos(pi*x/16);
figure(2)
subplot(2,1,1 ), stem(x,y) %������ � ������
subplot(2,1,2), plot(x,y) %������ ���������

%%
%=== �������� #1.3 ===
% ����������� ��������� ����������
n =[0:1:20];
a=0.8;% a,b,c,d ���� ����� 
b=-0.8;
c=1.1;
d=-1.1;
x1 = a.^n ;
x2 = b.^n ;
x3 = c.^n ;
x4 = d.^n ;
 
figure(3)
subplot(4,1,1), stem(x1);
subplot(4,1,2), stem(x2);
subplot(4,1,3), stem(x3);
subplot(4,1,4), stem(x4);


%%
%=== �������� #1.4 - 1.6 ===
%1.5
fs = 1000;
t = 0:1/fs:2;
s=3.*sin(6.*pi.*t)+sin(16.*pi.*t);
figure(4)
subplot(1,1,1), stem(s);
% � �������� ���� ������� �������
% function pks = pksdetect(s)
% pks = find(diff(diff(s) > 0) < 0);
% k = find(s(pks+1) > s(pks));
% pks(k)=pks(k)+1;
% end

% ����������� ��� �������
pks = pksdetect(s);
figure(5)
plot(t,s,'k-'); hold on;
plot(t(pks),s(pks),'k*'); hold off;
xlabel('time(s)');  ylabel('s(t)');

%%
%=== �������� #2.1 - 2.2 ===
% ����������� ������������� �������
n=0:1000;
sigma=0.25;
mu=0;
r=randn(size(n))*sigma+mu;% ���
s=1.8*cos(20*pi*n*(1/200));% ������
x=s+r;% ������+���
muR=mean(r);
muS=mean(s);
muX=mean(x);
DR=var(r);
DS=var(s);
DX=var(x);
fprintf('mu(r)=%4.3g\n',mean(r));
fprintf('mu(s)=%4.3g\n',mean(s));
fprintf('mu(x)=%4.3g\n',mean(x));
 
fprintf('D(r)=%4.3g\n',var(r));
fprintf('D(s)=%4.3g\n',var(s));
fprintf('D(x)=%4.3g\n',var(x));
 
figure(6);
subplot(3,1,1 ), plot(n,s );
subplot(3,1,2 ), plot(n,r );
subplot(3,1,3 ), plot(n,x );
�������� ������� ��������:
mu(r)=-0.00798
mu(s)=0.0018
mu(x)=-0.618
D(r)=0.0623
D(s)=1.62
D(x)=1.72


%%
%=== �������� #3.1 ===
% ���������� ����� ��������� � ����� pec1.dat 
% �� �������� ������� �������
pec1=load('pec1.dat');
fs = 1000; %������� �������������
fcg=pec1(:,1);
ecg=pec1(:,2);
cps=pec1(:,3);
t=(0:length(fcg)-1)/fs; % ��������� ��� ���� �� ������ 1/1000 �
 
figure(7);
subplot(3, 1, 1), plot (t, fcg);
title('biosignals'); %����� ����
xlabel('time'); %����� ��
ylabel('amplitude'); %����� ��
xlim([1 4]); %���������� ������� �� 1 �� 4
subplot(3, 1, 2), plot (t, ecg);
xlim([1 4]);
xlabel('time');
ylabel('amplitude');
subplot(3, 1, 3), plot (t, cps);
xlim([1 4]);
xlabel('time');
ylabel('amplitude');












