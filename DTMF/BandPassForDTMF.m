clc

ww = 0:1/500:pi ;

rowCoeff = load('rowFilterCoeff');

colCoeff = load('colFilterCoeff');

rowNum = rowCoeff.b;

rowDen = rowCoeff.a;

colNum = colCoeff.b;

colDen = colCoeff.a;
% 4.1 C
% H1 = freqz(rowNum, rowDen, ww);
% 
% grid on
% plot(ww,abs(H1));
% 
% H2 = freqz(colNum, rowDen, ww);
% 
% hold
% grid on
% Xlabel('Frequency (w)');
% plot(ww,abs(H2));

% 4.1 C End.



%4.3 a
% 
 DTMFsig = cos(2*pi*1209*(0:800)/4000 + rand(1)) + cos(2*pi*697*(0:800)/4000 + rand(1));
% 
 xx = firfilt(rowNum,DTMFsig);
% 
%xx = xx(1:2:end);
% 
% ss = onefreq(xx(200:250));
% 
% ss
% 4.3 a END

%4.3 b
% yy = cos(2*pi*1209*(0:800)/4000 + rand(1)) + cos(2*pi*697*(0:800)/4000 + rand(1));
% yy = firfilt(colNum,DTMFsig);
% 
% yy = yy(1:2:end);
% 
% tt = onefreq(yy(200:250));
% 
% tt
% 4.3 b END

% 4.3 c
% beg = 1;
% for nn = 1:5:(length(xx) - 5);
%     
% ff(beg) = onefreq(xx(nn:nn+4));
% beg = beg + 1;
% end
% %plotspec(xx,4000);
% ff;
% plot(ff);

% 4.3 c END

% 4.4 a
silence = zeros(1, 320);

DTMFsig1 = cos(2*pi*1209*(0:800)/4000 + rand(1)) + cos(2*pi*697*(0:800)/4000 + rand(1));

DTMFsig2 = cos(2*pi*1209*(0:800)/4000 + rand(1)) + cos(2*pi*697*(0:800)/4000 + rand(1));

xx = [DTMFsig1 silence DTMFsig2];


xxrow = firfilt(rowNum,xx);

xxrow = xxrow(1:2:end);

xxcol = firfilt(colNum,xx);

xxcol = xxcol(1:2:end);

bb = DTMFfreqs( [xxrow(:),xxcol(:)], 5);

stem(bb)
xlabel('n')
ylabel('frequency')
title('Plot of two 1209,697 Hz DTMF tones')
%4.4 a END









