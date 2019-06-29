function[mh]=messbox(text,title)
%[mh]=messbox(text,title)
%Show a message in a box

mh = msgbox(text, title,'help');     %create msgbox
th = findall(mh, 'Type', 'Text');                   %get handle to text within msgbox
th.FontSize = 10;  
mh.Position=[mh.Position(1) mh.Position(2) 250 mh.Position(4)]
end