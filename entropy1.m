function dale=entropy1(x);
tot = 0.0;
ent = 0.0;
for i=1:length(x)
tot = tot + x(i)^2;
end
for i=1:length(x)
quo = x(i)^2 / tot;
ent = ent + (quo * log10(quo));
dale(i)=(quo * log10(quo));
end
 %y = -ent;
 y = ent;
end