function[win]=out(V17,out)


aver=(V17)-mean(V17);

y = quantile(aver,[.25 .75]);
IQR=y(2)-y(1);

Y=[y(1)-out*(IQR) y(2)+out*(IQR)]; %Whiskers

% 
% aver=abs(aver)

win2=aver>=(Y(2)) ; %Above Upper whiskers
win3=aver<=(Y(1));
wi=or(win2,win3);
% unwanted=V17(wi);
% wi=not(wi);

    
    

%newvector=V17(wi);

end
