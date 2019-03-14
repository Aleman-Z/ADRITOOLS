function whosthis() %Displays the name of current file opened on editor.
CurrentFile=matlab.desktop.editor.getActiveFilename;
for r=length(CurrentFile):-1:1
   j=CurrentFile(1,r);
   if strcmp(j,'\')
       CurrentFile(1,r+1:end-2)
       break
   end
end
end