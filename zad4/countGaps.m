function [counter1,counter2] = countGaps(seq1,seq2)

n=length(seq1);
m=length(seq2);
counter1 = 0;
counter2=0;

for i=1:n
    if(seq1(i)=='-')
        counter1=counter1+1;
    end
end
    for j=1:m
        if(seq2(j)=='-')
        counter2=counter2+1;
        end
    end

end

