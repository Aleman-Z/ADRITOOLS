function [New_sig]=merge_min_duration(nsig,min_dur,n,fs_new)


min_dur=min_dur*fs_new;
Nsig=nsig;
New_sig=nsig;

v2=ConsecutiveOnes(nsig); %Self explainatory.
nsec=n*fs_new; %Number of samples equivalent to n seconds. 
v3=(v2>=nsec);

znsig=nsig.*0; %Vector for long on-periods

v3=v3.*v2;  %Only those above n seconds. 
iv3=v3>0; %Logic 
nb=sum(iv3); %Number of clusters
fi=find(iv3==1); %Indexes
fi=fi.';
    for k=1:nb;
         gr{k}= fi(1,k):fi(1,k)+v3(fi(1,k))-1;
         nind=max(fi(1,k):fi(1,k)+v3(fi(1,k))-1); %Last element of long on-period
         znsig(nind)=1; %Make one
         Nsig(gr{k})=0; %Updated vector
         
         in=find(or(Nsig,znsig)==1);
         
         if abs(diff(in(1:2)))*fs_new>min_dur
             
             New_sig(in(1):in(2))=1;
         end
       k/nb.*100  
    end

end