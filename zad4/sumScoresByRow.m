function sumScoresByRow(scoredMatrix,scores,A,match,mismatch,gap)
%funkcja dla macierzy punktacji sumuje po wierszach scory
sumyMaxScorow = [];
kolejnoscSekwencji = [1 2 3 4]';
%navigatorDoSortowanieSekwencji w tej macierzy w kolumnie 1. sumy w 
%kolumnie 2. odpowiadaj�ca temu sekwencja
navigatorDoSortowaniaSekwencji = zeros(4,2);
disp('sumujRzedemMaxScore');
for i = 1:size(scores,1)
    %sumuje w p�tli po wierszach maxScore
        sumyMaxScorow = [sumyMaxScorow ; sum(scores(i,:))];
        navigatorDoSortowaniaSekwencji(i,:) = [sumyMaxScorow(i,:) kolejnoscSekwencji(i,:)];  
end

%sortuje sumy maxScor�w malej�co
posortowaneSumy = sort(sumyMaxScorow,'descend')
%w ramach posortowania sum  sortuj� sekwencje
nowaKolejnoscSek =[];
for i = 1 : size(sumyMaxScorow,1)
    temporary = posortowaneSumy(i);
%     navigatorDoSortowaniaSekwencji(:,2);
    k = find(navigatorDoSortowaniaSekwencji(:,1)== temporary);
end
    nowaKolejnoscSek = [nowaKolejnoscSek ; A(k(1,1),:)];
  
    allWithoutStar = A;
    allWithoutStar(k(1,1),:)=[];
    nowaKolejnoscSek = [nowaKolejnoscSek ;allWithoutStar];
    %zagnie�d�ona funkcja do dopasowania
    starAlignment(nowaKolejnoscSek,match,mismatch,gap)
    
end


