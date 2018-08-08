function [f,Y] = frequency(y)
%FREQUENCY: Normalized frequency spectrum. 
%1=fs/2= pi for omega. 
%A larger value gives aliasing

input_dig_lst=y;
n=length(input_dig_lst);
% Plot single-sided amplitude spectrum.
NFFT = 2^nextpow2(n); % Next power of 2 from length of y
%NFFT=length(y);
%NFFT=1000;

Y = (fft(input_dig_lst,NFFT))/n;
f = linspace(0,1,NFFT/2+1);

%Sampling freq.
fs=1000;
f=f*(fs/2);
Y=2*abs(Y(1:NFFT/2+1));
% % % 
% % % % figure;
% % % plot(f,2*abs(Y(1:NFFT/2+1)));
% % % % % figure()
% % % % % stem(f,2*abs(Y(1:NFFT/2+1)))
% % % 
% % % grid on;
% % % title('Single-Sided Amplitude Spectrum of sampled signal')
% % % xlabel('Frequency (Hz)')
% % % ylabel('|Y(f)|')
  
end

