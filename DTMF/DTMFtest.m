clc

colCoeff = load('colFilterCoeff.mat');
rowCoeff = load('rowFilterCoeff.mat');
xx2 = load('lab10f10support.mat');
%that other support.mat file has 3 fields: fs, xxTT1 and xxTT2


xx = DTMFdial('679A582D#20C73*81B34',4000);
wavwrite(xx, 4000, 16, 'lab10output');

%you have to give the row and col coefficients exactly, don't give the
%struct
%keys = DTMFsys(xx,rowCoeff.b,colCoeff.b,2000);
keys = DTMFsys(xx2.xxTT2,rowCoeff.b,colCoeff.b,2000);
keys