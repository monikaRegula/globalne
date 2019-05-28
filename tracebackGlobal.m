function [score] = traceback(scoredMatrix,seq1,seq2,match,mismatch,gap)
%znalezienie optymalnego dopasowania polega na znalezieniu
%najkrótszej œcie¿ki z tabeli pochodz¹cej z globalMatching
%Je¿eli odpowiednio zmodyfikujê tabelê, bêdê mog³a odtworzyæ wszystkie
%optymalne transkrypty edycyjne. W tym celu muszê dodaæ do odpowiednich
%komórek wskaŸniki na ich poprzedników.
n = size(scoredMatrix,1);
m =  size(scoredMatrix,2);
%zmienna steps to tablica przechowuj¹ca kierunki wybranej drogi
%wystêpuje tu pewnego rodzaju mapowanie:
%1 lewa,2 przek¹tna,3 góra
%pomys³ mapowania kroków ze Ÿród³a: https://github.com/kaiweiang/Needleman-Wunsch-Algorithm/blob/master/needleman_wunsch.m
%oraz wykorzystanie pomys³u ze skryptu innego jêzyka programowania ze Ÿród³a: https://github.com/Orion9/NeedlemanWunsch/blob/master/src/NeedlemanWunsch.cpp
steps=[];

optimalPath(1,1)= 1%pocz¹tek tracebacku
optimalPath(m,n)= 1%koniec tracebacku

while (n~=1) && (m~=1)
    score = scoredMatrix(n,m);
    %warunek na górn¹
    if scoredMatrix(n-1,m) == score - gap
    optimalPath(n-1,m) = 1;
    n = n-1;
    steps = [steps,3];
    %warunek na lew¹
    elseif scoredMatrix(n,m-1) == score - gap
    optimalPath(n,m-1) = 1;
    m = m-1;
    steps = [steps,1];
   %warunek na przek¹tn¹
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

optimalPath;


end
%spy(optimalPath,'rd')  
%heatmap(optimalPath)
%xlabel('Sequence 1');
%ylabel('Sequence 2');

%odwróæ tablice z lewej na prawo optymalna œzie¿ka od góry
%steps = fliplr(steps)  
score = scoredMatrix(end,end);
scoredMatrix
saveE(seq1,seq2,steps,score,match,mismatch,gap)

