function [xx, tt] = make_chirp( f1, f2, dur, fsamp)
mu = 1000;
if( nargin < 4)
    fsamp = 10000;
end
tt = 0: (1/fsamp): dur;
psi = 2*pi*(f1*tt+ ((f2-f1)/(2*dur))*tt.*tt);
xx  = real( exp(j*psi));
