function omegahats = DTMFfreqs(yy, nskip) 

%DTMFFREQS 
% usage: omegahats = DTMFfreqs(yy, nskip) 
% returns vector of frequencies (between 0 and +pi) 
% yy = filtered signal that is guaranteed to contain only one sinusoid 
% put the row-filtered signal yyrow in the first column,
% and the column-filtered signal yycol in the 2nd column 
% nskip = interval for doing the frequency estimation, 
% i.e., yy(1:nskip), yy(nskip+1:2*nskip), yy(2*nskip+1:3*nskip), etc. % 
% omegahats = L by 2 matrix that contains the frequency estimates 
% The first column has freq estimates for the row-filtered signal; 
% second column has freq estimates for the column-filtered signal; 
% 

bb = 1;

for nn = 1:nskip:max(size(yy)- nskip+1)
    
omegahats(bb,1) = onefreq( yy(nn:nn+nskip-1,1) ); %--input signals are in 
omegahats(bb,2) = onefreq( yy(nn:nn+nskip-1,2) ); %--the columns of yy(:,:)
bb = bb + 1;

end