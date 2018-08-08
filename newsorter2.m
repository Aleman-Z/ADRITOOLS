function [newvec]=newsorter2(checale, sources) 
vec=nan(2,1);
sig=nan(2,1);
for i=1:2
rsig1=sources(i,:);

co1=corrcoef(rsig1, checale(1,:));
co1=co1(2);
co2=corrcoef(rsig1, checale(2,:));
co2=co2(2);

% co4=corrcoef(rsig1, checale(4,:));
% co4=co4(2);

co=([co1 co2]);

vec(i)=find(abs(co)==max(abs(co)));
%vec(i)=find(co==max(co));
sig(i)=co(vec(i))<0;
if co(vec(i))<0
    sources(i,:)=sources(i,:).*(-1);
end

end

  newvec(vec,:)=sources;
%   if length(unique(vec))<4
%     
%   end
end
