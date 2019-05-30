function [scoredMatrix,prawyRog] = globalMatching(seq1,seq2,match,mismatch,gap)
%Funkcja generuje macierz punktacji dla dw�ch podanych sekwencji oraz parametr�w
%zgodno��, niezgodno�� oraz gap. Posiada r�wnie� zagnie�d�on� funkcj�
%znajduj�c� drog� optymalnego dopasowania.
seq2(seq2 == ' ') = [];
seq1(seq1 == ' ') = [];
s1 = length(seq1);
s2 = length(seq2);
scoredMatrix = zeros(s1+1,s2+1);%prealokacja
scoredMatrix(1,2:end) = (1:s2) * gap;%warunki pocz�tkowe pierwszego wiersza
scoredMatrix(2:end,1) = (1:s1) * gap;%warunki pocz�tkowe pierwszej kolumny
n = size(scoredMatrix,1);
m = size(scoredMatrix,2);

for i = 2:n %iteracja po wierszach
    for j = 2:m %iteracja po kolumnach
        %obliczam rekurencyjnie kolejn� kom�rk� dla r�nych przypadk�w
        if(seq1(i-1) == seq2(j-1))%przypadek dopasowania po przek�tnej
            diagonal = scoredMatrix(i-1,j-1) + match;
        else
            diagonal = scoredMatrix(i-1,j-1) + mismatch;%niezgodno��
        end
        left = scoredMatrix(i-1,j) + gap; %z lewej 
        up = scoredMatrix(i,j-1) + gap; %z g�ry
        %wybranie maksimum z 3 opcji score: diagonal,left,up
        % maksimum to odleg�o�� edycyjna pomi�dzy seq1 a seq2
        maxScore = max([diagonal, left,up]);
        scoredMatrix(i,j)= maxScore;
    end
  
end
prawyRog = scoredMatrix(n,m);
end


