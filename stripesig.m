function stripesig(vtr,sos)
plot(sos)
hold on
rrc=area(vtr.*max(sos),'FaceColor','none');
alpha(0.5)

set(rrc, 'FaceColor', 'r');

end