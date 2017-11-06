%=== �������� #3.1 ===
% ����������� ������������� �������
fs = 200 ; 
N = 400 ;
%t=100;
s1 = sin(2*pi*10*t);   
s2 = sin(2*pi*20*t) ; 
s =[s1 s2];
t =(0:(length(s)-1))/fs ;
v= 2*randn(size(t)) ;  
x = s+v ;

%=== �������� #3.2 ===
% Գ�������� ������� ���������� ��������
L=128; mu =  0.0001;
[y,e,w] = lms(s,x,mu,L);
a=1;
% ������� ���������� ����������
figure(13)
y=filter(w,a,x);
%t=100;
subplot(3,1,1),plot(x),grid on
xlabel('t'), ylabel('x');
subplot(3,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

n =512;
[h,f]=freqz(w,a,n);
mag=abs(h);
subplot(3,1,3),plot(f/(2*pi)*fs,mag),grid on
xlabel('�������'), ylabel('��������')
title('��� ����������� ������� ��� ������ L=128')

%=== �������� #3.3  ===
% ���������� ��������� ���� ��������� �� ����������� ���������
L=128; mu =  0.01;
[y,e,w] = lms(s,x,mu,L);
% ������� ���������� ����������
figure(14)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('³������������� ������ ���  mu=0.01')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

L=128; mu =  0.000001;
[y,e,w] = lms(s,x,mu,L);
% ������� ���������� ����������
figure(15)
y=filter(w,a,x);
%t=100;
subplot(2,1,1),plot(x),grid on
title('³������������� ������ ���  mu=0.000001')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');



%=== �������� #3.4 ===
% ���������� ��������� ��������� ���������� ��� ���� ������ �������
L=256; mu =0.0001;
[y,e,w] = lms(s,x,mu,L);
% ������� ���������� ����������
figure(16)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('³������������� ������ ��� L=256')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

L=512; mu =0.0001;
[y,e,w] = lms(s,x,mu,L);
% ������� ���������� ����������
figure(17)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('³������������� ������ ��� L=512')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

L=1024; mu =0.0001;
[y,e,w] = lms(s,x,mu,L);
% ������� ���������� ����������
figure(18)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('³������������� ������ ��� L=1024')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');
% xlim([2000 5000])


%=== �������� #4.1 ===
% ������������ ������� ��� � ���������� (���� ecg2x60.dat) 
ecg = load('ecg2x60.dat');
ecg = detrend(ecg);

%=== �������� #4.2 ===
% Գ�������� ������� ���������� ��������
ecg = load('ecg2x60.dat');
f=60;  fs=200;  mu = 0.1;
t = (0:(length(ecg)-1))/fs;
d = [cos(2*pi*f*t); sin(2*pi*f*t)];
figure(19)
% a = 1;
[y,e,w] = lms60(ecg,d,mu)
y = filter(w,a,ecg);
subplot(3,1,1),plot(t,ecg),grid on
title('��� ������')
xlabel('t'), ylabel('ecg')
subplot(3,1,2),plot(t,e),grid on
title('³������������� ��� ������')
xlabel('t'), ylabel('e')
title('�������� ��� ������ y(n)')
subplot(3,1,3),plot(t,y),grid on
xlabel('t'), ylabel('y')

% ��� ����������� �������
figure(20)
n =512;
[h,f]=freqz(w,a,n);
mag=abs(h);
subplot(1,1,1),plot(f,mag),grid on
xlabel('�������'), ylabel('��������')
title('��� ����������� �������')

%=== �������� #4.3 ===
% ���������� �������� ����������� ����������� ������� ���� ��������� ���������
disp('w')

%=== �������� #4.4 ===
% ���������� ��������� ���� ��������� �� ����������� ���������
% mu =  0.01;
ecg = load('ecg2x60.dat');

f=60;  fs=200;  mu =  0.01;
t = (0:(length(ecg)-1))/fs;
d = [cos(2*pi*f*t); sin(2*pi*f*t)];
figure(21)
% a = 1;
[y,e,w] = lms60(ecg,d,mu)
y = filter(w,a,ecg);
subplot(2,1,1),plot(t,ecg),grid on
title('��� ������ ��� mu=0.01')
xlabel('t'), ylabel('��������')
subplot(2,1,2),plot(t,y),grid on
xlabel('t'), ylabel('y')


% mu =  0.0001;
ecg = load('ecg2x60.dat');
f=60;  fs=200;  mu =  0.0001;
t = (0:(length(ecg)-1))/fs;
d = [cos(2*pi*f*t); sin(2*pi*f*t)];
figure(22)
%a = 1;
[y,e,w] = lms60(ecg,d,mu)
y = filter(w,a,ecg);
subplot(2,1,1),plot(t,ecg),grid on
title('��� ������ ��� mu=0.0001')
xlabel('t'), ylabel('��������')
subplot(2,1,2),plot(t,y),grid on
xlabel('t'), ylabel('y')

% mu =  0.000001;
ecg = load('ecg2x60.dat');
f=60;  fs=200;  mu =  0.000001;
t = (0:(length(ecg)-1))/fs;
d = [cos(2*pi*f*t); sin(2*pi*f*t)];
figure(23)
% a = 1;
[y,e,w] = lms60(ecg,d,mu)
y = filter(w,a,ecg);
subplot(2,1,1),plot(t,ecg),grid on
title('��� ������ ��� mu=0.000001')
xlabel('t'), ylabel('ecg')
subplot(2,1,2),plot(t,y),grid on
xlabel('t'), ylabel('y')

