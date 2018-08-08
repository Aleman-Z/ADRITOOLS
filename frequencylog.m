function [f,Y] = frequencylog(y)
  
input_dig_lst=y;
n=length(input_dig_lst);
% Plot single-sided amplitude spectrum.
%NFFT = 2^nextpow2(n); % Next power of 2 from length of y
NFFT=length(y);
Y = (fft(input_dig_lst,NFFT))/n;
f = linspace(0,1,NFFT/2+1);
nac=2*abs(Y(1:NFFT/2+1));

% figure;
plot(f,log(nac)/log(10)) 
grid on;
title('Single-Sided Amplitude Spectrum of sampled signal')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
  
end