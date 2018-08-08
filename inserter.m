function[x2]=inserter(x1,L)
n=length(x1)*L; %Length of new vector
x2=zeros(n,1);%New zero vector

x2(1)=x1(1);%First element different to zero
counter=2;

for i=1:length(x2)
if mod(i-1,L)==0 % Find multiples of L
    x2(i)=x1(counter-1);
    if counter<=length(x1)
    counter=counter+1;
    end
end
end

end

