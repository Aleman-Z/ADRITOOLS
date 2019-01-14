function A=getfolder
     A = dir(cd);
     A=A(~ismember({A.name},{'.','..'})); %Remove dots
    A = A([A.isdir]); %Only folders.
    A={A.name};

end