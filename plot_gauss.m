clear
clc
close all 
ff = 55:1760; % frequency range
fc = 440; %center frequency
sigma = 1; %sigma, or half-width
ww = exp(-(log2(ff)-log2(fc)).^2/(2.*(sigma^2)));
subplot(3,1,1)
plot(log2(ff), ww) %plot with log2 scale 
hold on
subplot(3,1,2)
plot(ff, ww) %regular plot
subplot(3,1,3)
semilogx(ff, ww) %plot with semilogx
