%Plotter function
function plotter(S,t,f,Serr)

subplot(3,1,1)
imagesc(t,f,10*log10(abs(squeeze(Serr(1,:,:)).')))
%imagesc(t,f,(S.'))


set(gca,'YDir','Normal')
colorbar
xlabel('Time (secs)')
ylabel('Freq (Hz)')
title('Lower confidence')


subplot(3,1,2)
imagesc(t,f,10*log10(abs(S.')))
%imagesc(t,f,(S.'))


set(gca,'YDir','Normal')
colorbar
xlabel('Time (secs)')
ylabel('Freq (Hz)')
title('X')

subplot(3,1,3)
imagesc(t,f,10*log10(abs(squeeze(Serr(2,:,:)).')))
%imagesc(t,f,(S.'))


set(gca,'YDir','Normal')
colorbar
xlabel('Time (secs)')
ylabel('Freq (Hz)')
title('Upper confidence')

end