function keys = DTMFsys(xx,hrow,hcol,fs)

%DTMFSYS keys = DTMFsys(xx,M,fs)
% returns the list of key names found in xx.
% keys = array of characters, i.e., the decoded key names
% xx = Touch-Tone waveform
% hrow = row filter
% hcol = column filter
% fs = sampling freq

TT.keys = ['1','2','3','A';
           '4','5','6','B';
           '7','8','9','C';
           '*','0','#','D'];
       
TT.colTones = ones(4,1)*[1209,1336,1477,1633]; 
TT.rowTones = [697;770;852;941]*ones(1,4);

nskip = 5; %this is previously defined in another file

yyrow = firfilt(hrow,xx); 

yyrow = yyrow(1:2:end);

yycol = firfilt(hcol,xx);

yycol = yycol(1:2:end);

omegahats = DTMFfreqs( [yyrow(:),yycol(:)], nskip);

keys = DTMFkeys( TT, omegahats, nskip, fs);
