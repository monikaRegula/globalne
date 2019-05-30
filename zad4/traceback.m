function [steps] = traceback(scoredMatrix,seq1,seq2,match,mismatch,gap)
%znalezienie optymalnego dopasowania polega na znalezieniu
%najkr�tszej �cie�ki z tabeli pochodz�cej z globalMatching
%Je�eli odpowiednio zmodyfikuj� tabel�, b�d� mog�a odtworzy� wszystkie
%optymalne transkrypty edycyjne. W tym celu musz� doda� do odpowiednich
%kom�rek wska�niki na ich poprzednik�w.
n = size(scoredMatrix,1);
m =  size(scoredMatrix,2);
%zmienna steps to tablica przechowuj�ca kierunki wybranej drogi
%wyst�puje tu pewnego rodzaju mapowanie:
%1 lewa,2 przek�tna,3 g�ra
%pomys� mapowania krok�w ze �r�d�a: https://github.com/kaiweiang/Needleman-Wunsch-Algorithm/blob/master/needleman_wunsch.m
%oraz wykorzystanie pomys�u ze skryptu innego j�zyka programowania ze �r�d�a: https://github.com/Orion9/NeedlemanWunsch/blob/master/src/NeedlemanWunsch.cpp
steps=[];

optimalPath(1,1)= 1;%pocz�tek tracebacku
optimalPath(m,n)= 1;%koniec tracebacku

while (n~=1) && (m~=1)
    score = scoredMatrix(n,m);
    %warunek na g�rn�
    if scoredMatrix(n-1,m) == score - gap
    optimalPath(n-1,m) = 1;
    n = n-1;
    steps = [steps,3];
    %warunek na lew�
    elseif scoredMatrix(n,m-1) == score - gap
    optimalPath(n,m-1) = 1;
    m = m-1;
    steps = [steps,1];
   %warunek na przek�tn�
    elseif scoredMatrix(n-1,m-1) == score - match || scoredMatrix(n-1,m-1) == score - mismatch
    optimalPath(n-1,m-1) = 1;
    n = n-1;
    m = m-1;
    steps = [steps,2];
end

 if n == 1
        while m ~=1                    
            optimalPath(n,m) = 1;              
            m = m-1;
            steps = [steps,1];               
        end
    end
    if m == 1                           
         while n ~=1                   
            optimalPath(n,m) = 1;
            n = n-1;
             steps = [steps,3];                
         end
    end
end 

end



