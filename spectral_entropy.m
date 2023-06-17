function [en_tropy]=spectral_entropy(signal,f1,f2,fn)
%signal (trace of event, bandpassed in its respective band)
%f1 lower bound frequency
%f2 upper bound frequency
%fn sampling rate. 

if isempty(signal)
    en_tropy=[];
    return
end

if size(signal,1)==1
[pxx,f]=periodogram(signal,[],[],fn);
%plot(f,pxx)
else
[pxx,f]=periodogram(signal',[],[],fn); %129 484 
end
[Ind1]=findclosest(f,f1); 
[Ind2]=findclosest(f,f2);

if size(signal,1)==1
npxx=pxx(Ind1:Ind2)/sum(pxx(Ind1:Ind2)); %[22 1]/ [1 1] =[22 1]
else
npxx=pxx(Ind1:Ind2,:)./sum(pxx(Ind1:Ind2,:)); %[22 484]/[1 484]
end

en_tropy=-(sum(npxx.*log2(npxx)));



end

