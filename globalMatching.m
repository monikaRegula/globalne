function [match] = globalMatching(seq1,seq2,match,mismatch,gap)
%Funkcja generuje macierz punktacji dla dwóch podanych sekwencji oraz parametrów
%zgodnoœæ, niezgodnoœæ oraz gap. Posiada równie¿ zagnie¿d¿on¹ funkcjê
%znajduj¹c¹ drogê optymalnego dopasowania.
s1 = length(seq1);
s2 = length(seq2);
scoredMatrix = zeros(s1+1,s2+1);%prealokacja
scoredMatrix(1,2:end) = (1:s2) * gap;%warunki pocz¹tkowe pierwszego wiersza
scoredMatrix(2:end,1) = (1:s1) * gap;%warunki pocz¹tkowe pierwszej kolumny
n = size(scoredMatrix,1);
m = size(scoredMatrix,2);

for i = 2:n %iteracja po wierszach
    for j = 2:m %iteracja po kolumnach
        %obliczam rekurencyjnie kolejn¹ komórkê dla ró¿nych przypadków
        if(seq1(i-1) == seq2(j-1))%przypadek dopasowania po przek¹tnej
            diagonal = scoredMatrix(i-1,j-1) + match;
        else
            diagonal = scoredMatrix(i-1,j-1) + mismatch;%niezgodnoœæ
        end
        left = scoredMatrix(i-1,j) + gap; %z lewej 
        up = scoredMatrix(i,j-1) + gap; %z góry
        left
        up
        %wybranie maksimum z 3 opcji score: diagonal,left,up
        % maksimum to odleg³oœæ edycyjna pomiêdzy seq1 a seq2
        maxScore = max([diagonal, left,up]);
        %[maxScore, maxIndex] = max([diagonal left up]);
        scoredMatrix(i,j)= maxScore;
       % indexes(i,j) = maxIndex;
     
    end
  
end
imagesc(scoredMatrix)
       xlabel('Sequence 1');
       ylabel('Sequence 2');
       colorbar
%zagnie¿dzenie funkcji traceback
tracebackGlobal(scoredMatrix,seq1,seq2,match,mismatch,gap)

end


