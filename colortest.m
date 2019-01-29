
function colortest(vec)

    t = (1/16:1/8:1)'*2*pi;
    x = cos(t);
    y = sin(t);


    fill(x,y,vec)
    axis square
    title('Testing color')

end