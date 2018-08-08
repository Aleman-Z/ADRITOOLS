% % % 
% % % l=7000;
% % % subplot(2,4,1)
% % % plot(checale(1:l,1))
% % % title('Mixed Reference')
% % % subplot(2,4,2)
% % % plot(checale(1:l,2))
% % % title('Mixed PFC')
% % % subplot(2,4,3)
% % % plot(checale(1:l,3))
% % % title('Mixed Parietal')
% % % subplot(2,4,4)
% % % plot(checale(1:l,4))
% % % title('Mixed Hippocampus')
% % % 
% % % subplot(2,4,5)
% % % plot(sources(1,1:l))
% % % subplot(2,4,6)
% % % plot(sources(2,1:l))
% % % subplot(2,4,7)
% % % plot(sources(3,1:l))
% % % subplot(2,4,8)
% % % plot(sources(4,1:l))

%
% % % % checale=checale';
%

function [newvec]=sorter(checale, sources) 
vec=nan(4,1);
sig=nan(4,1);
for i=1:4
rsig1=sources(i,:);

co1=corrcoef(rsig1, checale(1,:));
co1=co1(2);
co2=corrcoef(rsig1, checale(2,:));
co2=co2(2);
co3=corrcoef(rsig1, checale(3,:));
co3=co3(2);
co4=corrcoef(rsig1, checale(4,:));
co4=co4(2);

co=([co1 co2 co3 co4]);

vec(i)=find(abs(co)==max(abs(co)));
%vec(i)=find(co==max(co));
sig(i)=co(vec(i))<0;
if co(vec(i))<0
    sources(i,:)=sources(i,:).*(-1);
end

end

newvec(vec,:)=sources;
end

% subplot(2,4,1)
% plot(checale(1:l,1))
% title('Mixed Reference')
% subplot(2,4,2)
% plot(checale(1:l,2))
% title('Mixed PFC')
% subplot(2,4,3)
% plot(checale(1:l,3))
% title('Mixed Parietal')
% subplot(2,4,4)
% plot(checale(1:l,4))
% title('Mixed Hippocampus')

% % % l=7000;
% % % 
% % % subplot(2,4,1)
% % % plot(checale(1,1:l))
% % % title('Mixed Reference')
% % % subplot(2,4,2)
% % % plot(checale(2,1:l))
% % % title('Mixed PFC')
% % % subplot(2,4,3)
% % % plot(checale(3,1:l))
% % % title('Mixed Parietal')
% % % subplot(2,4,4)
% % % plot(checale(4,1:l))
% % % title('Mixed Hippocampus')
% % % 
% % % subplot(2,4,5)
% % % plot(newvec(1,1:l))
% % % subplot(2,4,6)
% % % plot(newvec(2,1:l))
% % % subplot(2,4,7)
% % % plot(newvec(3,1:l))
% % % subplot(2,4,8)
% % % plot(newvec(4,1:l))


% % % 
% % % R9=cell(length(X9),1);
% % % R12=cell(length(X9),1);
% % % 
% % % f=find(win==1);
% % % 
% % % for i=1:length(X9)
% % % if win(i)==0
% % % %if C3(i)>median(C3)
% % % 
% % %     
% % %     Z1=X9{i};
% % %     Z2=X12{i};
% % % 
% % %     Z=[Z1.';Z2.'];
% % %     [A1 B]=fastica(Z);
% % % 
% % %     sources=B*Z;
% % %     co1=corrcoef((sources(1,:)),Z1);
% % %     co2=corrcoef((sources(1,:)),Z2);
% % %     co21=corrcoef((sources(2,:)),Z1);
% % %     co22=corrcoef((sources(2,:)),Z2);
% % %     co1=co1(2);
% % %     co2=co2(2);
% % %     co21=co21(2);
% % %     co22=co22(2);
% % %     co=abs([co1 co2 co21 co22]);
% % %     
% % %     %if kurtosis(sources(1,:))> kurtosis(sources(2,:))
% % %     %if sum(sum(abs(co1)))>sum(sum(abs(co2)))
% % %     %if abs(co1(2))+abs(co2(2))> abs(co21(2))+abs(co22(2))
% % %     if abs(co1)>abs(co2)   
% % %        R12{i}=sources(2,:);
% % %        R9{i}=sources(1,:);
% % % 
% % %        if co1<0
% % %           R9{i}=R9{i}*-1; 
% % %        end
% % %        
% % %        if co22<0
% % %           R12{i}=R12{i}*-1; 
% % %        end
% % % 
% % %     else
% % %         R12{i}=sources(1,:);
% % %         R9{i}=sources(2,:);
% % % 
% % %         if co22<0
% % %           R9{i}=R9{i}*-1; 
% % %        end
% % %        if co21<2
% % %           R12{i}=R12{i}*-1; 
% % %        end    
% % %     end
% % % else 
% % %     R9{i}=X9{i};
% % %     R12{i}=X12{i};
% % % 
% % %   
% % % end
% % % i
% % % end
