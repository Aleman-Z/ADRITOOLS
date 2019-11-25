function [znsig]=min_duration(nsig,n,fs_new)

%Correct to right vector arrangement.
if size(nsig,1)>size(nsig,2)
    nsig=nsig.';
end 

znsig=nsig.*0; %Initialize vector with zeros.
v2=ConsecutiveOnes(nsig); %Self explainatory.

nsec=n*fs_new; %Number of samples equivalent to n seconds. 

v3=(v2>=nsec);
v3=v3.*v2;  %Only those above n seconds. 
iv3=v3>0; %Logic 


nb=sum(iv3); %Number of clusters
fi=find(iv3==1); %Indexes

    for k=1:nb;
        gr{k}= fi(1,k):fi(1,k)+v3(fi(1,k))-1;
        znsig(gr{k})=1;
    end

end