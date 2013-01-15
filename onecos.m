function [xx, tt] = onecos(freq, camp, dur, tstart)
%part 2 of lab
tt = tstart:1/(48*freq):(tstart+dur); %48 samples per period
xx = real(camp*exp(j*freq*2*pi*tt));



end