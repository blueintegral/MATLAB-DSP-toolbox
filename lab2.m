%regular plot
n = 240;
for k = 1:n
    xk(k) = k/80;
    rk(k) = sqrt(xk(k) * xk(k) - 1)+ 1;
    sig(k) = exp(j*2*pi*rk(k));
end
plot( xk, real(sig), 'mo-', xk, imag(sig), 'go-')

hold on;
%mine
sig2 = exp(j*2*pi*(sqrt(((1:240)/80).*((1:240)/80) -1) +1)); %answer to part 1
plot( xk, real(sig2), 'bo-', xk, imag(sig2), 'ro-')


