function[new_vector]=decimator(vector1,m)
warndlg('Replace decimation function with downsample()','Adritools Suggestion')
new_vector=[]; %New vector
counter=1;
n=length(vector1);
for x=(1:m:n) %Decimator step
 new_vector(counter)=vector1(x);%Assign value
 counter=counter+1; %Increase counter
%  new_vector=new_vector'; 
end

end
