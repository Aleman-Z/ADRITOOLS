function [en_tropy]=spectral_entropy(signal,f1,f2,fn)
%signal (trace of event, bandpassed in its respective band)
%f1 lower bound frequency
%f2 upper bound frequency
%fn sampling rate. 

[pxx,f]=periodogram(signal,[],[],fn);
%plot(f,pxx)

[Ind1]=findclosest(f,f1); 
[Ind2]=findclosest(f,f2);

npxx=pxx(Ind1:Ind2)/sum(pxx(Ind1:Ind2));

en_tropy=-(sum(npxx.*log2(npxx)));



end

