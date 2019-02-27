function messbox(text,title)
mh = msgbox(text, title,'help');     %create msgbox
th = findall(mh, 'Type', 'Text');                   %get handle to text within msgbox
th.FontSize = 10;  
end