function dale=entropy2(x);
ent = 0.0;
m = mean(x);
for i=1:length(x)
quo = abs(x(i) - m);
ent = ent + (quo * log10(quo));
dale(i)=(quo * log10(quo))*-1;
end
%y = -ent;
y = ent;

end