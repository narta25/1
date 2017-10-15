function lab03_main
%=== ���������:������ ������� ��������� ���������� ===
%--- ����������� ������ #3 Բ�����ֲ� ��������˲� Բ������� � Ͳ�
%
% �������������� ����� �����: 
%   ecg105.txt - ������ ���
%   ecg2x60.dat - ������ ��� � ��������� ���������� �������� 60 ��
%
%----------------------------------------------------------


clear, clc, close all
disp('����������� ������ #3')
disp('Բ�����ֲ� ��������˲� Բ������� � Ͳ�')
disp('��������:     C������� ������, ����� ��-461 �Ͳ���')

%=== �������� #1.1 ===
% ������������ ��������� ������� 2-�� ������� 
fs = 200; 
fc = 20;                % ���������� �������
phi = 2*pi*fc/fs;
r = 0.6;
b = [1 0 -1];           % ��������� C� 
a = [1 -2*r*cos(phi) r^2]; 	% ���������

%=== �������� #1.2 ===
% ��� �� ��� ��������� ������� 2-�� �������
n =512;   % ������� �����, �� ��������������
figure(1)
[h,w] = freqz(b,a,n);
mag=abs(h); phase=angle(h)*180/pi;
subplot(3,1,1); plot(w/(2*pi)*fs,mag), grid on
title('��� ��������� ������� 2-�� �������')
xlabel('�������'); ylabel('��������')
subplot(3,1,2); plot(w/(2*pi)*fs,unwrap(phase)), grid on
title('��� ��������� ������� 2-�� �������')
xlabel('�������'); ylabel('��������')

% ���������� ���� �� ������ �������
disp('��� �������') 
x = roots(b);
disp(x)
% ����� ���� �� ������ �������
subplot(3,1,3); k=zplane(x); grid on



%=== �������� #1.3 ===
% r = 0.7
r1 = 0.7;
b1=[1 0 -1];
a1 =[1 -2*r1*cos(phi) r1^2];	% ���������
figure(2)
[h1,w1] = freqz(b1,a1,n);
mag1=abs(h1); phase1=angle(h1)*180/pi;
subplot(3,1,1); plot(w1/(2*pi)*fs,mag1,'green'), grid on
title({'��� ��������� ������� 2-�� �������';'�������������� ������� 2-�� ������� ��� r = 0.7'})
xlabel('�������'); ylabel('��������')
subplot(3,1,2); plot(w1/(2*pi)*fs,unwrap(phase1),'green'), grid on
title('��� ��������� ������� 2-�� �������')
xlabel('�������'); ylabel('��������')

% ���������� ���� �� ������ �������
disp('��� �������') 
x1 = roots(b1);
disp(x1)
% ����� ���� �� ������ �������
subplot(3,1,3); k1=zplane(x1); grid on

% r = 0.9
r2 = 0.9;
b2 =[1 0 -1];               % ��������� C� 
a2 =[1 -2*r2*cos(phi) r2^2]; 	% ���������
figure(3)
[h2,w2] = freqz(b2,a2,n);
mag2=abs(h2); phase2=angle(h2)*180/pi;
subplot(3,1,1); plot(w2/(2*pi)*fs,mag2,'red'), grid on
title({'��� ��������� ������� 2-�� �������';'�������������� ������� 2-�� ������� ��� r = 0.9'})
xlabel('�������'); ylabel('��������')
subplot(3,1,2); plot(w2/(2*pi)*fs,unwrap(phase2),'red'), grid on
title('��� ��������� ������� 2-�� �������')
xlabel('�������'); ylabel('��������')
xlim([0 40])

% ���������� ���� �� ������ �������
disp('��� �������') 
x2 = roots(b2);
disp(x2)
% ����� ���� �� ������ �������
subplot(3,1,3); k1=zplane(x2); grid on

figure(4)
subplot(2,1,1); plot(w/(2*pi)*fs,mag), grid on
hold on
title('��� ��������� ������� 2-�� �������')
xlabel('�������'); ylabel('��������')
subplot(2,1,2); plot(w/(2*pi)*fs,unwrap(phase)), grid on
hold on
title('��� ��������� ������� 2-�� �������')
xlabel('�������'); ylabel('��������')

subplot(2,1,1); plot(w1/(2*pi)*fs,mag1,'green'), grid on
subplot(2,1,2); plot(w1/(2*pi)*fs,unwrap(phase1),'green'), grid on
subplot(2,1,1); plot(w2/(2*pi)*fs,mag2,'red'), grid on
hold off
subplot(2,1,2); plot(w2/(2*pi)*fs,unwrap(phase2),'red'), grid on
hold off

%%
%=== �������� #1.4 ===
% ���������� ���������� ������� ������� 
q=fc./(w/(2*pi)*fs);
% disp(q)
%%
%=== �������� #1.5 ===
%�������� ������� ���������� �������
figure(5)
subplot(3,1,1), stepz(b,a,n); xlim([0.9 20])
subplot(3,1,2), stepz(b1,a1,n); xlim([0.9 20])
subplot(3,1,3), stepz(b2,a2,n); xlim([0.9 20])
%%
%=== �������� #2.1 ===
% Գ�������� ��� ��� r = 0.6
fs=200;
ecg=load('ecg105.txt'); % ������ ���
ecg=detrend(ecg);
ecgf = filter(b,a,ecg);
t=(0:length(ecgf)-1)/fs;
figure(6)
subplot(2,1,1); plot(t,ecg,'red'), grid on
xlim([0.5 2.5]); ylim([-200 200])
title('������������� ������ ���')
xlabel('��� (t)'); ylabel('��������')
subplot(2,1,2); plot(t,ecgf), grid on
xlim([0.5 2.5]); ylim([-200 200])
title('B�������������� c����� ���')
xlabel('��� (t)'); ylabel('��������')


%=== �������� #2.2 ===
% Գ�������� ��� ��� r = 0.7 �� r = 0.8
% r = 0.7
ecgf1 = filter(b1,a1,ecg);
t=(0:length(ecgf1)-1)/fs;
figure(7)
subplot(2,1,1); plot(t,ecg,'red'), grid on
xlim([0.5 2.5]); ylim([-200 200])
title('������������� ������ ���')
xlabel('��� (t)'); ylabel('��������')
subplot(2,1,2); plot(t,ecgf1), grid on
xlim([0.5 2.5]); ylim([-200 200])
title('B�������������� c����� ���')
xlabel('��� (t)'); ylabel('��������')

% r = 0.9
ecgf2 = filter(b2,a2,ecg);
t=(0:length(ecgf2)-1)/fs;
figure(8)
subplot(2,1,1); plot(t,ecg,'red'), grid on
xlim([0.5 2.5]); ylim([-200 200])
title('������������� ������ ���')
xlabel('��� (t)'); ylabel('��������')
subplot(2,1,2); plot(t,ecgf2), grid on
xlim([0.5 2.5]); ylim([-200 200])
title('B�������������� c����� ���')
xlabel('��� (t)'); ylabel('��������')

%%
%=== �������� #3.1 ===
% ���������� ������������ ������������ Ͳ�-�������
fs = 200;
r =  0.8;
phi1 = 110*pi/180;
phi2 = 130*pi/180;
a1 =  [1 -2*r*cos(phi1) r^2];
a2 = [1 -2*r*cos(phi2) r^2];
a = conv(a1,a2);
b = [1 1 1]/3;
disp('������������ ������� ������������ Ͳ�-�������')
H =  filt (b,a);  % ������������ �������

%=== �������� #3.2 ===
% ��� �� ��� ��������� ������������ Ͳ�-�������
n = 512;  % ������� �����, �� ��������������
figure(9)
[h,w] = freqz(b,a,n);
mag=abs(h); phase=angle(h)*180/pi;
subplot(3,1,1); plot(w/(2*pi)*fs,mag), grid on
title('��� ��������� ������������ Ͳ�-�������')
xlabel('�������'); ylabel('��������')
subplot(3,1,2); plot(w/(2*pi)*fs,unwrap(phase)), grid on
title('��� ��������� ������������ Ͳ�-�������')
xlabel('�������'); ylabel('��������')

% ���������� ���� �� ������ �������
disp('��� ������������ Ͳ�-�������') 
x = roots(b);
disp(x)

% ����� ���� �� ������ �������
subplot(3,1,3); k=zplane(x); grid on


%=== �������� #3.3 ===
% ��������� ��� � ��� ����������� Ͳ� � Ѳ�-�������
open('CIX_filter.fig')


%=== �������� #3.4 ===
% Գ�������� ������� ���(���� ecg2x60.dat) ����������� ��������
ecg=load('ecg2x60.dat');
ecgf = filter(b,a,ecg);
t=(0:length(ecg)-1)/fs;
figure(11)
subplot(2,1,1); plot(t,ecg,'red'), grid on
xlim([0 1])
title('������������� ������ ���')
xlabel('��� (t)'); ylabel('��������')
subplot(2,1,2); plot(t,ecgf), grid on
xlim([0 1]); 
title('B�������������� c����� ���')
xlabel('��� (t)'); ylabel('��������')

%%
%=== �������� #4.1 ===
% ��� � ��� �������� �����������
% ������������ ������� ������������ 
fs = 300;      % ������� �������������
T = 1/fs; 
b =T*1;          % ��������� ��
a = [1 -1];      % ��������� ��
% ������������ ������� ��������.
b1 = [1 1]*T/2;
a1 = [1 -1];
% ������������ ������� ������� (ѳ������)
b2 = [1 4 1]*T/3;
a2 = [1 0 -1];

n = 512;   % ������� �����, �� ��������������
[h,f] = freqz(b,a,n);
mag=abs(h); phase=angle(h)*180/pi;
[h1,f1] = freqz(b1,a1,n);
mag1=abs(h1); phase1=angle(h1)*180/pi;
[h2,f2] = freqz(b2,a2,n);
mag2=abs(h2); phase2=angle(h2)*180/pi;
figure(12)
subplot(2,3,1); plot(f/(2*pi)*fs,mag), grid on
ylim([-0.1 0.6]); xlim([-5 155])
title({'��� ����������� ��������';'������������'})
xlabel('�������'); ylabel('��������')
subplot(2,3,4); plot(f/(2*pi)*fs,unwrap(phase)), grid on
ylim([-10 90]); xlim([-5 155])
title({'��� ����������� ��������';'������������'})
xlabel('�������'); ylabel('��������')
subplot(2,3,2); plot(f1/(2*pi)*fs,mag1), grid on
ylim([-0.1 0.6]); xlim([-5 155])
title('��������'); xlabel('�������'); ylabel('��������')
subplot(2,3,5); plot(f1/(2*pi)*fs,unwrap(phase1)), grid on
ylim([-2.2 0.1]); xlim([-10 155])
title('��������'); xlabel('�������'); ylabel('��������')
subplot(2,3,3); plot(f2/(2*pi)*fs,mag2), grid on
ylim([-0.1 0.6]); xlim([-5 155])
title('������� (ѳ������)'); xlabel('�������'); ylabel('��������')
subplot(2,3,6); plot(f2/(2*pi)*fs,unwrap(phase2)), grid on
ylim([-2.2 0.1]); xlim([-10 155])
title('������� (ѳ������)'); xlabel('�������'); ylabel('��������')


%=== �������� #4.2 ===
% ���������� ���� �� ������ �����������
disp('��� �� ������ ����������� ������� ������������') 
l = roots(b); g = roots(a);
disp(l)
disp(g)
disp('��� �� ������  ����������� ������� ��������') 
l1 = roots(b1); g1 = roots(a);
disp(l1)
disp(g1)
disp('��� �� ������  ����������� ������� ������� (ѳ������)') 
l2 = roots(b2); g2 = roots(a);
disp(l2)
disp(g2)

figure(13)
% ����� ���� �� ������ �������
subplot(3,1,1); j=zplane(l,g); grid on
title('����� ���� �� ������ ����������� ������� ������������')
ylabel('Im. Part')
subplot(3,1,2); j1=zplane(l1,g1); grid on
title('����� ���� �� ������ ����������� ������� ��������')
ylabel('Im. Part')
subplot(3,1,3); j2=zplane(l2,g2); grid on
title('����� ���� �� ������ ����������� ������� ������� (ѳ������)')
ylabel('Im. Part')

% ������������ ������� �����������
disp('������������ ������� ����������� ������� ������������') 
H=filt(b,a)
disp('������������ ������� ����������� ������� ��������') 
H1=filt(b1,a1)
disp('������������ ������� ����������� ������� ������� (ѳ������)') 
H2=filt(b2,a2)


%%
%=== �������� #4.3 ===
% ���������� ��������� ������� ���
figure(14)
subplot(2,1,1)
mag0 =1./(2*pi*f);  % ��� ���������� ����������� 
loglog(f,mag0,f,mag); grid on
title('������ ������� ����������� ������� ������������')
err = (mag-mag0)*100;
subplot(2,1,2); 
plot(f,err); grid on	
ylim([-3000 500]); xlim([-0.2 3.5])

figure(15)
subplot(2,1,1)
mag01 =1./(2*pi*f1);  % ��� ���������� ����������� 
loglog(f1,mag01,f1,mag1); grid on
title('������ ������� ����������� ������� ��������')
err1 = (mag1-mag01)*100;
subplot(2,1,2); 
plot(f1,err1); grid on	
ylim([-3000 500]); xlim([-0.2 3.5])

figure(16)
subplot(2,1,1)
mag02 =1./(2*pi*f2);  % ��� ���������� ����������� 
loglog(f2,mag02,f2,mag2); grid on
title('������ ������� ����������� ������� ������� (ѳ������)')
err2 = (mag2-mag02)*100;
subplot(2,1,2); 
plot(f2,err2); grid on	
ylim([-3000 500]); xlim([-0.2 3.5])

%%
%=== �������� #4.4 ===
% ������������ ������� ��� (���� ecg105.txt) ������������� 
fs = 200;
ecg = load('ecg105.txt'); % ������ ���
ecgd = detrend(ecg);
figure(17)
% ���������� �� ������� ������������
fti=filter(b,a,ecgd);
subplot(3,1,1); plot(fti), grid on
axis tight
title('������������ ������� ��� �� ������� ������������')
% ���������� �� ������� ��������
fti1=filter(b1,a1,ecgd);
subplot(3,1,2); plot(fti1), grid on
axis tight
title('������������ ������� ��� �� ������� ��������')
% ���������� �� ������� ������� (ѳ������)
fti2=filter(b2,a2,ecgd);
subplot(3,1,3); plot(fti2), grid on
axis tight
title('������������ ������� ��� ������� ������� (ѳ������)')
