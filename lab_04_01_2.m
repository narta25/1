%=== Завдання #3.1 ===
% Моделювання досліджуваного сигналу
fs = 200 ; 
N = 400 ;
%t=100;
s1 = sin(2*pi*10*t);   
s2 = sin(2*pi*20*t) ; 
s =[s1 s2];
t =(0:(length(s)-1))/fs ;
v= 2*randn(size(t)) ;  
x = s+v ;

%=== Завдання #3.2 ===
% Фільтрація сигналу адаптивним фільтром
L=128; mu =  0.0001;
[y,e,w] = lms(s,x,mu,L);
a=1;
% Графіки результату фільтрації
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
xlabel('Частота'), ylabel('Амплітуда')
title('АЧХ адаптивного фільтру при довжині L=128')

%=== Завдання #3.3  ===
% Дослідження залежності часу адаптації від коефіцієнта адаптації
L=128; mu =  0.01;
[y,e,w] = lms(s,x,mu,L);
% Графіки результату фільтрації
figure(14)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('Відфільтрований сигнал при  mu=0.01')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

L=128; mu =  0.000001;
[y,e,w] = lms(s,x,mu,L);
% Графіки результату фільтрації
figure(15)
y=filter(w,a,x);
%t=100;
subplot(2,1,1),plot(x),grid on
title('Відфільтрований сигнал при  mu=0.000001')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');



%=== Завдання #3.4 ===
% Дослідження процедури адаптивної фільтрації при різній довжині фільтру
L=256; mu =0.0001;
[y,e,w] = lms(s,x,mu,L);
% Графіки результату фільтрації
figure(16)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('Відфільтрований сигнал при L=256')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

L=512; mu =0.0001;
[y,e,w] = lms(s,x,mu,L);
% Графіки результату фільтрації
figure(17)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('Відфільтрований сигнал при L=512')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');

L=1024; mu =0.0001;
[y,e,w] = lms(s,x,mu,L);
% Графіки результату фільтрації
figure(18)
y=filter(w,a,x);
subplot(2,1,1),plot(x),grid on
title('Відфільтрований сигнал при L=1024')
xlabel('t'), ylabel('x');
subplot(2,1,2),plot(y),grid on
xlabel('t'), ylabel('y');
% xlim([2000 5000])


%=== Завдання #4.1 ===
% Завантаження сигналу ЕКГ з перешкодою (файл ecg2x60.dat) 
ecg = load('ecg2x60.dat');
ecg = detrend(ecg);

%=== Завдання #4.2 ===
% Фільтрація сигналу адаптивним фільтром
ecg = load('ecg2x60.dat');
f=60;  fs=200;  mu = 0.1;
t = (0:(length(ecg)-1))/fs;
d = [cos(2*pi*f*t); sin(2*pi*f*t)];
figure(19)
% a = 1;
[y,e,w] = lms60(ecg,d,mu)
y = filter(w,a,ecg);
subplot(3,1,1),plot(t,ecg),grid on
title('ЕКГ сигнал')
xlabel('t'), ylabel('ecg')
subplot(3,1,2),plot(t,e),grid on
title('Відфільтровнаий ЕКГ сигнал')
xlabel('t'), ylabel('e')
title('Вихідний ЕКГ сигнал y(n)')
subplot(3,1,3),plot(t,y),grid on
xlabel('t'), ylabel('y')

% АЧХ адаптивного фільтру
figure(20)
n =512;
[h,f]=freqz(w,a,n);
mag=abs(h);
subplot(1,1,1),plot(f,mag),grid on
xlabel('Частота'), ylabel('Амплітуда')
title('АЧХ адаптивного фільтру')

%=== Завдання #4.3 ===
% Визначення значення коефіцієнтів адаптивного фільтру після закінчення адаптації
disp('w')

%=== Завдання #4.4 ===
% Дослідження залежності часу адаптації від коефіцієнта адаптації
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
title('ЕКГ сигнал при mu=0.01')
xlabel('t'), ylabel('Амплітуда')
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
title('ЕКГ сигнал при mu=0.0001')
xlabel('t'), ylabel('Амплітуда')
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
title('ЕКГ сигнал при mu=0.000001')
xlabel('t'), ylabel('ecg')
subplot(2,1,2),plot(t,y),grid on
xlabel('t'), ylabel('y')

