
function progress_bar(yourvariable,limitvalue,f)
%Initiate outside for loop with:
%f=waitbar(0,'Please wait...');

    %for yourvariable=dam:limitvalue
    waitbar(yourvariable/limitvalue,f,strcat('Loading',{' '},num2str(yourvariable/limitvalue*100),'%'));    
    pause(0.2)
    %end
    %close(f)
    if yourvariable==limitvalue
    waitbar(1,'MISSION PASSED. RESPECT :)')
    pause(0.2)
    close(f)
    end
end