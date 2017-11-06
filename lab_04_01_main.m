%function lab04_main
%=== ���������: ������ ������� ���������� ������� �� �������� ===
%--- ����������� ������ #4 ���������� � ��������� Բ�����ֲ� ��������˲� 
%
% �������������� ����� �����: 
% ecg2x60.dat - ������ ��� � ��������� ���������� �������� 60 ��
%
% ������� (m-�����), �� ��������� ���������:
% wiener_hopf.m - ���������� ����������� ������� ³����
% lms.m - LMS-�������� ���������
%----------------------------------------------------------
clear, clc, close all
disp('����������� ������ #4')
disp('���������� � ��������� Բ�����ֲ� ��������˲�')
disp('��������: C������� ������  , ����� ��-461 ����')

%=== �������� #1.1 ===
% ����������� ������������� �������
 fs = 200; N =400; 
 t = (0:(N-1))/fs ;		% ������ ����
 v = 2*randn(size(t)) ;  
 s = sin(2*pi*10*t)+sin(2*pi*20*t) ;
 x = s+v ;

%=== �������� #1.2 ===
%  ������������ ������������ ������� ³���� �������� L=32
 L = 32 ; 			      % ������� �������
 b = wiener_hopf(x,s,L);	   % ���������� �����������
 
%=== �������� #1.3 ===
 %Գ�������� ������������� ������� 
a =1;
y=filter(b,a,s);

figure(1)
subplot(3,1,1), plot (x), grid on
title('C����� x(n) ��� L=32')
xlabel('t'), ylabel('x')
% xlim([1 200]), ylim ([-5 5])

subplot(3,1,2), plot(s), grid on
title('C����� s(n) ��� L=32')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])

subplot(3,1,3), plot (y), grid on
title('³������������� ������ y(n) ��� L=32')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

 
% ------ ��� ������� ³����
n = 512; a=1 % ������� �����, �� ��������������
figure(2)
[h,f] = freqz(b,a,n);    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('�������'), ylabel('��������')
title('��� ������� ³����')
 
% === �������� #1.4 ===
%  �������� ��������� �.1.3 ��� ������ ������� 64, 128, 256 �����
L = 64; 			       % ������� �������
b = wiener_hopf(x,s,L);	   % ���������� �����������
% ��� ������� ³����
n = 512;  % ������� �����, �� ��������������
y=filter(b,a,s);

figure(3)
subplot(3,1,1), plot (x), grid on
title('C����� x(n) ��� L=64')
xlabel('t'), ylabel('x')
%xlim([1 200]), ylim ([-5 5])
subplot(3,1,2), plot(s), grid on
title('C����� s(n) ��� L=64')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])
subplot(3,1,3), plot (y), grid on
title('³������������� ������ y(n) ��� L=64')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

% ------ ��� ������� ³���� ��� L=64
figure(4)
[h,f] = freqz(b,a,n);    
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on 
xlabel('�������'), ylabel('��������')
title('��� ������� ³���� ��� L=64')

 L=128 ; 			       % ������� �������
 b = wiener_hopf(x,s,L);	   % ���������� �����������
% ��� ������� ³����
n = 512;  % ������� �����, �� ��������������
y=filter(b,a,s);

figure(5)
subplot(3,1,1), plot (x), grid on
title('C����� x(n) ��� L=128')
xlabel('t'), ylabel('x')
%xlim([1 200]), ylim ([-5 5])
subplot(3,1,2), plot(s), grid on
title('C����� s(n) ��� L=128')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])
subplot(3,1,3), plot (y), grid on
title('³������������� ������ y(n) ��� L=128')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

% ------ ��� ������� ³���� ��� L=128
figure(6)
[h,f] = freqz(b,a,n);    
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on 
xlabel('�������'), ylabel('��������')
title('��� ������� ³���� ��� L=128')
             
 L=256;    % ������� �������
 b = wiener_hopf(x,s,L);	   % ���������� �����������
% ��� ������� ³����
n = 512;  % ������� �����, �� ��������������
y=filter(b,a,s);

figure(7)
subplot(3,1,1), plot (x), grid on
title('C����� x(n) ��� L=256')
xlabel('t'), ylabel('x')
%xlim([1 200]), ylim ([-5 5])

subplot(3,1,2), plot(s), grid on
title('C����� s(n) ��� L=256')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])

subplot(3,1,3), plot (y), grid on
title('³������������� ������ y(n) ��� L=256')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

% ------ ��� ������� ³���� ��� L=256
figure(8)
[h,f] = freqz(b,a,n);    
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on 
xlabel('�������'), ylabel('��������')
title('��� ������� ³���� ��� L=256')
             

%=== �������� #1.5 ===
%  ���������� ������� �������� ������� ����������� ��������
%  ...



%=== �������� #2.1 ===
% ����������� ������������� �������
fs = 200 ; 
N = 400 ; 
t =(0:(N-1))/fs ;		% ������ ����
s = sin(2*pi*10*t) ;
v = 2*randn(size(t)) ;  
x = s+v ;

%=== �������� #2.3 ===
% ������� ����������� �������. Գ�������� ������������� �������.
L =128;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(9)
a=1; y=filter(w,a,x);
subplot(3,1,1), plot (s), grid on
title('C����� s(n) (���������� ������)')
xlabel('t'), ylabel('s')

subplot(3,1,2), plot(y), grid on
title('C����� y(n) (���������� ������)')
xlabel('t'), ylabel('y')

% ----- ��� ����������� �������
n = 512 ;  % ������� �����, �� ��������������
a = 1;
[h,f] = freqz(w,a,n);
mag=abs(h)
subplot(3,1,3), plot(f/(2*pi)*fs,mag), grid on
title('��� ����������� �������')
xlabel('�������'), ylabel('��������')


%=== �������� #2.4 ===
% ���������� ��������� ���� ��������� �� ����������� ���������
% mu =  0.01
fs = 200 ; 
N = 400 ;
t = (0:(N-1))/fs;       % ����������
s =  sin(2*pi*10*t);
v = 2*randn(size(t)) ;  
x =s+v ;

L = 128; 
mu =  0.01;
[y,e,w] = lms(x,s,mu,L)

figure(10)
a=1; y=filter(w,a,x);
subplot(2,1,1), plot (s), grid on
title('C����� s(n) (���������� ������)')
xlabel('t'), ylabel('s')

subplot(2,1,2), plot(y), grid on
title('C����� y(n) (���������� ������)')
xlabel('t'), ylabel('y')

% mu =  0.000001
fs = 200 ; 
N = 400 ;
t = (0:(N-1))/fs;       % ����������
s =  sin(2*pi*10*t);
v = 2*randn(size(t)) ;  
x =s+v ;

L = 128; 
mu =  0.000001;
[y,e,w] = lms(x,s,mu,L)

figure(11)
a=1; y=filter(w,a,x);
subplot(2,1,1), plot (s), grid on
title('C����� s(n) (���������� ������)')
xlabel('t'), ylabel('s')

subplot(2,1,2), plot(y), grid on
title('C����� y(n) (���������� ������)')
xlabel('t'), ylabel('y')

%=== �������� #2.5 ===
% ���������� ��������� ��������� ���������� ��� ���� ������ �������
L =256;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(12)
a=1; y=filter(w,a,
x);
subplot(3,1,1), plot(y), grid on
title('C����� y(n) ��� L =256 (���������� ������)')
xlabel('t'), ylabel('y')

fs = 200 ; 
N = 1100 ;
t = (0:(N-1))/fs;       % ����������
s =  sin(2*pi*10*t);
v = 2*randn(size(t)) ;  
x =s+v ;

L =512;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
a=1; y=filter(w,a,x);
subplot(3,1,2), plot(y), grid on
title('C����� y(n) ��� L =512 (���������� ������)')
xlabel('t'), ylabel('y')

L =1024;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
a=1; y=filter(w,a,x);
subplot(3,1,3), plot(y), grid on
title('C����� y(n) ��� L =1024 (���������� ������)')
xlabel('t'), ylabel('y')


