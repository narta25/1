%function lab04_main
%=== Дисципліна: Основи обробки біомедичних сигналів та зобраень ===
%--- Лабораторна робота #4 ОПТИМАЛЬНА І АДАПТИВНА ФІЛЬТРАЦІЯ БІОСИГНАЛІВ 
%
% Використовуйте файли даних: 
% ecg2x60.dat - сигнал ЕКГ з мережевою перешкодою частотою 60 Гц
%
% Функції (m-файли), що необхідно розробити:
% wiener_hopf.m - обчислення коефіцієнтів фільтра Вінера
% lms.m - LMS-алгоритм адаптації
%----------------------------------------------------------
clear, clc, close all
disp('Лабораторна робота #4')
disp('ОПТИМАЛЬНА І АДАПТИВНА ФІЛЬТРАЦІЯ БІОСИГНАЛІВ')
disp('Виконала: Cоколова Марина  , група БМ-461 ІІДС')

%=== Завдання #1.1 ===
% Моделювання досліджуваного сигналу
 fs = 200; N =400; 
 t = (0:(N-1))/fs ;		% вектор часу
 v = 2*randn(size(t)) ;  
 s = sin(2*pi*10*t)+sin(2*pi*20*t) ;
 x = s+v ;

%=== Завдання #1.2 ===
%  Синтезування оптимального фільтру Вінера довжиною L=32
 L = 32 ; 			      % порядок фільтра
 b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
 
%=== Завдання #1.3 ===
 %Фільтрація досліджуваного сигналу 
a =1;
y=filter(b,a,s);

figure(1)
subplot(3,1,1), plot (x), grid on
title('Cигнал x(n) при L=32')
xlabel('t'), ylabel('x')
% xlim([1 200]), ylim ([-5 5])

subplot(3,1,2), plot(s), grid on
title('Cигнал s(n) при L=32')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])

subplot(3,1,3), plot (y), grid on
title('Відфільтрований сигнал y(n) при L=32')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

 
% ------ АЧХ фільтру Вінера
n = 512; a=1 % кількість точок, що розраховуються
figure(2)
[h,f] = freqz(b,a,n);    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('Частота'), ylabel('Амплітуда')
title('АЧХ фільтру Вінера')
 
% === Завдання #1.4 ===
%  повторіть дослідженн п.1.3 при довжині фільтра 64, 128, 256 відліків
L = 64; 			       % порядок фільтра
b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
% АЧХ фільтру Вінера
n = 512;  % кількість точок, що розраховуються
y=filter(b,a,s);

figure(3)
subplot(3,1,1), plot (x), grid on
title('Cигнал x(n) при L=64')
xlabel('t'), ylabel('x')
%xlim([1 200]), ylim ([-5 5])
subplot(3,1,2), plot(s), grid on
title('Cигнал s(n) при L=64')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])
subplot(3,1,3), plot (y), grid on
title('Відфільтрований сигнал y(n) при L=64')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

% ------ АЧХ фільтру Вінера при L=64
figure(4)
[h,f] = freqz(b,a,n);    
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on 
xlabel('Частота'), ylabel('Амплітуда')
title('АЧХ фільтру Вінера при L=64')

 L=128 ; 			       % порядок фільтра
 b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
% АЧХ фільтру Вінера
n = 512;  % кількість точок, що розраховуються
y=filter(b,a,s);

figure(5)
subplot(3,1,1), plot (x), grid on
title('Cигнал x(n) при L=128')
xlabel('t'), ylabel('x')
%xlim([1 200]), ylim ([-5 5])
subplot(3,1,2), plot(s), grid on
title('Cигнал s(n) при L=128')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])
subplot(3,1,3), plot (y), grid on
title('Відфільтрований сигнал y(n) при L=128')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

% ------ АЧХ фільтру Вінера при L=128
figure(6)
[h,f] = freqz(b,a,n);    
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on 
xlabel('Частота'), ylabel('Амплітуда')
title('АЧХ фільтру Вінера при L=128')
             
 L=256;    % порядок фільтра
 b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
% АЧХ фільтру Вінера
n = 512;  % кількість точок, що розраховуються
y=filter(b,a,s);

figure(7)
subplot(3,1,1), plot (x), grid on
title('Cигнал x(n) при L=256')
xlabel('t'), ylabel('x')
%xlim([1 200]), ylim ([-5 5])

subplot(3,1,2), plot(s), grid on
title('Cигнал s(n) при L=256')
xlabel('t'), ylabel('s')
%xlim([1 200]), ylim ([-2 2])

subplot(3,1,3), plot (y), grid on
title('Відфільтрований сигнал y(n) при L=256')
xlabel('t'), ylabel('y')
%xlim([1 200]), ylim ([-2 2])

% ------ АЧХ фільтру Вінера при L=256
figure(8)
[h,f] = freqz(b,a,n);    
mag = abs(h);
plot(f/(2*pi)*fs,mag), grid on 
xlabel('Частота'), ylabel('Амплітуда')
title('АЧХ фільтру Вінера при L=256')
             

%=== Завдання #1.5 ===
%  Обчислення дисперсії передачі сигналу оптимальним фільтром
%  ...



%=== Завдання #2.1 ===
% Моделювання досліджуваного сигналу
fs = 200 ; 
N = 400 ; 
t =(0:(N-1))/fs ;		% вектор часу
s = sin(2*pi*10*t) ;
v = 2*randn(size(t)) ;  
x = s+v ;

%=== Завдання #2.3 ===
% Синтезу адаптивного фільтру. Фільтрація змодельваного сигналу.
L =128;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(9)
a=1; y=filter(w,a,x);
subplot(3,1,1), plot (s), grid on
title('Cигнал s(n) (адаптивний фільтр)')
xlabel('t'), ylabel('s')

subplot(3,1,2), plot(y), grid on
title('Cигнал y(n) (адаптивний фільтр)')
xlabel('t'), ylabel('y')

% ----- АЧХ адаптивного фільтру
n = 512 ;  % кількість точок, що розраховуються
a = 1;
[h,f] = freqz(w,a,n);
mag=abs(h)
subplot(3,1,3), plot(f/(2*pi)*fs,mag), grid on
title('АЧХ адаптивного фільтру')
xlabel('Частота'), ylabel('Амплітуда')


%=== Завдання #2.4 ===
% Дослідження залежності часу адаптації від коефіцієнта адаптації
% mu =  0.01
fs = 200 ; 
N = 400 ;
t = (0:(N-1))/fs;       % векторчасу
s =  sin(2*pi*10*t);
v = 2*randn(size(t)) ;  
x =s+v ;

L = 128; 
mu =  0.01;
[y,e,w] = lms(x,s,mu,L)

figure(10)
a=1; y=filter(w,a,x);
subplot(2,1,1), plot (s), grid on
title('Cигнал s(n) (адаптивний фільтр)')
xlabel('t'), ylabel('s')

subplot(2,1,2), plot(y), grid on
title('Cигнал y(n) (адаптивний фільтр)')
xlabel('t'), ylabel('y')

% mu =  0.000001
fs = 200 ; 
N = 400 ;
t = (0:(N-1))/fs;       % векторчасу
s =  sin(2*pi*10*t);
v = 2*randn(size(t)) ;  
x =s+v ;

L = 128; 
mu =  0.000001;
[y,e,w] = lms(x,s,mu,L)

figure(11)
a=1; y=filter(w,a,x);
subplot(2,1,1), plot (s), grid on
title('Cигнал s(n) (адаптивний фільтр)')
xlabel('t'), ylabel('s')

subplot(2,1,2), plot(y), grid on
title('Cигнал y(n) (адаптивний фільтр)')
xlabel('t'), ylabel('y')

%=== Завдання #2.5 ===
% Дослідження процедури адаптивної фільтрації при різній довжині фільтру
L =256;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(12)
a=1; y=filter(w,a,
x);
subplot(3,1,1), plot(y), grid on
title('Cигнал y(n) при L =256 (адаптивний фільтр)')
xlabel('t'), ylabel('y')

fs = 200 ; 
N = 1100 ;
t = (0:(N-1))/fs;       % векторчасу
s =  sin(2*pi*10*t);
v = 2*randn(size(t)) ;  
x =s+v ;

L =512;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
a=1; y=filter(w,a,x);
subplot(3,1,2), plot(y), grid on
title('Cигнал y(n) при L =512 (адаптивний фільтр)')
xlabel('t'), ylabel('y')

L =1024;  mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
a=1; y=filter(w,a,x);
subplot(3,1,3), plot(y), grid on
title('Cигнал y(n) при L =1024 (адаптивний фільтр)')
xlabel('t'), ylabel('y')


