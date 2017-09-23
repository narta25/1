
function lab01_main
%=== Дисципліна:Основи обробки біомедичної інформації ===
%--- Лабораторна робота #1 Моделювання дискретних сигналів ---
%
% Використовуйте файли даних: 
% pec1.dat - сигнал ФКГ, ЕКГ та каротидного пульсу
%
% Функції користувача (m-файли), які необхідно розробити:
% pks = pksdetect(х) - знаходження піків в дискретному сигналі
%--------------------------------------------------------------------

clear, clc, close all
disp('Лабораторна робота #1')
disp('Моделювання дискретних сигналів')
disp('Виконав:Cоколова М. А., група БМ-461 ІІДС') 

%=== Завдання #1.1 ===
% Моделювання одиничного імпульсу
N = 12 ; % 12 поділок
n = 0:N-1 ;%графік почнається не з 0, а з 1
x1 =double(n==0); %вісь х1
x2 =double(n==2); %вісь Х2
 
figure(1)
subplot(2,1,1 ), stem(x1 ), %2-кіл-сть рядків 1-ккіл-сть совбців 1-перший графік
subplot(2,1,2 ), stem(x2 ), 

%%
%=== Завдання #1.2 === 
% Моделювання дискретного сигналу
x = 0:4:200; %0-початок 200-кінец  4- густота точек 
y=cos(pi*x/16);
figure(2)
subplot(2,1,1 ), stem(x,y) %графік в точках
subplot(2,1,2), plot(x,y) %графік звичайний

%%
%=== Завдання #1.3 ===
% Моделювання дискретної експоненти
n =[0:1:20];
a=0.8;% a,b,c,d були задані 
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
%=== Завдання #1.4 - 1.6 ===
%1.5
fs = 1000;
t = 0:1/fs:2;
s=3.*sin(6.*pi.*t)+sin(16.*pi.*t);
figure(4)
subplot(1,1,1), stem(s);
% в окремому файлі зберігаю функцію
% function pks = pksdetect(s)
% pks = find(diff(diff(s) > 0) < 0);
% k = find(s(pks+1) > s(pks));
% pks(k)=pks(k)+1;
% end

% Знаходження піків сигналу
pks = pksdetect(s);
figure(5)
plot(t,s,'k-'); hold on;
plot(t(pks),s(pks),'k*'); hold off;
xlabel('time(s)');  ylabel('s(t)');

%%
%=== Завдання #2.1 - 2.2 ===
% Моделювання стохастичного сигналу
n=0:1000;
sigma=0.25;
mu=0;
r=randn(size(n))*sigma+mu;% шум
s=1.8*cos(20*pi*n*(1/200));% сигнал
x=s+r;% сигнал+шум
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
Отримали наступні значення:
mu(r)=-0.00798
mu(s)=0.0018
mu(x)=-0.618
D(r)=0.0623
D(s)=1.62
D(x)=1.72


%%
%=== Завдання #3.1 ===
% Зчитування відліків біосигналів з файлу pec1.dat 
% та побудова графіків сигналів
pec1=load('pec1.dat');
fs = 1000; %частота дискретизації
fcg=pec1(:,1);
ecg=pec1(:,2);
cps=pec1(:,3);
t=(0:length(fcg)-1)/fs; % приводимо вісь часу до періоду 1/1000 с
 
figure(7);
subplot(3, 1, 1), plot (t, fcg);
title('biosignals'); %підпис вікна
xlabel('time'); %підпис вісі
ylabel('amplitude'); %підпис вісі
xlim([1 4]); %виділяється діапазон від 1 до 4
subplot(3, 1, 2), plot (t, ecg);
xlim([1 4]);
xlabel('time');
ylabel('amplitude');
subplot(3, 1, 3), plot (t, cps);
xlim([1 4]);
xlabel('time');
ylabel('amplitude');












