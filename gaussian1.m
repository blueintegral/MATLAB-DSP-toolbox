function [w ] = gaussian( cfrq,var,keynum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

freq = 440*2^((keynum-49)/12);

w=exp((-(log2(freq)-log2(cfrq))^2)/(2*(var^2)));

%subplot(3,1,1)
%plot(freq,w);

%subplot(3,1,2)
%semilogx(freq,w)
%subplot(3,1,3)
%plot(log2(freq),w)


end

