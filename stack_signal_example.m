x = 0:10:300;
%generate numbers in [-50,50]
y1 = -50 + 100*rand(numel(x),1);
y2 = -50 + 100*rand(numel(x),1);
y3 = -50 + 100*rand(numel(x),1);
y4 = -50 + 100*rand(numel(x),1);
%now add some offset to move the y values up
y2 = y2 + 200; %zero would be at y = 200
y3 = y3 + 400; %zero would be at y = 400
y4 = y4 + 600; %zero would be at y = 600
plot(x,y1,x,y2,x,y3,x,y4)
for i=1:4
    line([0,300],[(i-1)*200,(i-1)*200],'LineStyle','--','Color',[0 0 0])
end
set(gca,'ytick',[-50,0,50,150,200,250,350,400,450,550,600,650])
set(gca,'yticklabel',repmat({'-50','0','50'},1,3))
text(305,0,'z=50')
text(305,200,'z=150')
text(305,400,'z=250')
text(305,600,'z=350')
xlabel 'Position [mm]'
ylabel('$u_z[10^{-3} m/s]$','interpreter','latex')