function [x,f] = gaussian(mu,st)
fs=1;
long=100;
 st=st/fs;
% L=5;
% M=8;
mu=mu/fs;

%Gaussian pulse
a=1/(st.*sqrt(2*pi));
b=mu;
c=st;
%x=linspace(-15,15,205)./fs;
x=linspace(-15,15,long)./fs;


f=a.*exp(-((x-b).^2)/(2.*c^2));

%stem(x,f)
end
%%
% % % % % fs=10e6;
% % % % % st=3/fs;
% % % % % % L=5;
% % % % % % M=8;
% % % % % mu=(0)/fs;
% % % % % 
% % % % % %Gaussian pulse
% % % % % a=1/(st.*sqrt(2*pi));
% % % % % b=mu;
% % % % % c=st;
% % % % % %x=linspace(-15,15,205)./fs;
% % % % % x=linspace(-15,15,25)./fs;
% % % % % 
% % % % % 
% % % % % f=a.*exp(-((x-b).^2)/(2.*c^2))
% % % % % 
% % % % % stem(x,f)
% %%
% %making k delay
% y1=upsample(f,8);
% x1=upsample(x,8);
% 
% Delay = dsp.Delay(5);
% y2=step(Delay,y1');
% 
% 
% % stem(y1)
% % hold on
% stem(y2)
% 
% yfilt=filter(fraction,y2);
% stem(yfilt)
% 
% ydec=decimate(yfilt,8);
% 
% 
% stem(x,f)
% figure()
% stem(x,8*ydec')
% 
% 
% %%
% %Interpolation using LPF_FIR
% Y2filt=filter(LPF_FIR,y2);
% 
% y3=downsample(Y2filt,2);
% subplot(4,1,1)
% stem(f);
% subplot(4,1,2)
% stem(y1);
% subplot(4,1,3)
% stem(y2);
% subplot(4,1,4)
% stem(2*y3);
% 
% %%
% Delay = dsp.Delay(1);
% y2=step(Delay,f');
% 
% yfilt=filter(filtro8,y2);
% 
% 
% stem(x,f,'LineWidth',1.2)
% hold on
% stem(x,yfilt','LineWidth',1.2)
% title('Efficient Fractional delay')
% legend('x(n)','x(n)*z(-5/8fs)')
% xlabel('time')
% ylabel('Amplitude')
% 
% 
