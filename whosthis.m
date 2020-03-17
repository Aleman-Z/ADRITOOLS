function whosthis() %Displays the name of current file opened on editor.
CurrentFile=matlab.desktop.editor.getActiveFilename;
x=1;
    for r=length(CurrentFile):-1:1
       j=CurrentFile(1,r);
       if strcmp(j,'\')
                  x-0;
           CurrentFile(1,r+1:end-2)
           break
       end
    end
    
    if x==1
        CurrentFile=matlab.desktop.editor.getActiveFilename
    end
end