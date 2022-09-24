function [x,y,z,w,h,q,l,p,si_mixed,th,PCA_features]=event_specs(si,timeasleep,print_hist,fs)
% Computes main features of events detected
PCA_features=[];
    if ~isempty(si)

        %% Instantaneous frequency.
        x=cellfun(@(equis) mean(instfreq(equis,fs)) ,si,'UniformOutput',false);
        x=cell2mat(x);
        if print_hist==1
        end
        PCA_features(:,1)=x;
        x=median(x);

        %% Average frequency
        y=cellfun(@(equis) (meanfreq(equis,fs)) ,si,'UniformOutput',false);
        y=cell2mat(y);
        th=NaN;
        si_mixed.g1=NaN;
        si_mixed.i1=NaN;
        si_mixed.g2=NaN;
        si_mixed.i2=NaN;
 
        if print_hist==1         
        end
        PCA_features(:,2)=y;
        y=median(y);

        %% Amplitude
        z=cellfun(@(equis) max(abs(hilbert(equis))) ,si,'UniformOutput',false);
        z=cell2mat(z);
        if print_hist==1          
        end
        PCA_features(:,3)=z;
        z=median(z);
        
        %% Area under the curve
        l=cell2mat(cellfun(@(equis) trapz((1:length(equis))./fs,abs(equis)),si,'UniformOutput',false));
        if print_hist==1          
        end
        PCA_features(:,4)=l;
        l=median(l);

        %% Count
        w=length(si);

        %% Rate
        h=w/(timeasleep*(60));

        %% Duration
        q=(cellfun('length',si)/fs);
        if print_hist==1
        end
        PCA_features(:,5)=q;
        q=median(q);
        
        %% Peak-to-peak distance
        p=cellfun(@peak2peak,si);
        if print_hist==1       
        end
        PCA_features(:,6)=p;
        p=median(p);
        
        %% POWER
        PCA_features(:,7)=cellfun(@power_signal,si);

        %% Entropy
        PCA_features(:,8)=cellfun(@entropy,si);

        %% number of peaks
        PCA_features(:,9)=cell2mat(cellfun(@(equis) length(findpeaks(equis)),si,'UniformOutput',false));
        %% Spectral entropy
        PCA_features(:,10)=cell2mat(cellfun(@(equis) spectral_entropy(equis,100,300,fs),si,'UniformOutput',false  ));
    else
        x=NaN;
        y=NaN;
        z=NaN;
        w=NaN;
        h=NaN;
        q=NaN;
        l=NaN;
        p=NaN;
        th=NaN;
        si_mixed.g1=NaN;
        si_mixed.i1=NaN;
        si_mixed.g2=NaN;
        si_mixed.i2=NaN;
    end
end