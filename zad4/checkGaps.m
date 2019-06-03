function checkGaps(starCenter,matchedSeq,stars)
%por�wnuj� centrum gwiazdy z wygenerowanymi dopasowaniami
%centrami gwiazdy ; ka�de nast�pne centrum gwiazdy jest pozosta�o�ci� z poprzedniej
%p�tli dopasowania
actualStarCenter{1} = starCenter;

for i = 1 : 3
    nowaGwiazda=''; 
    %stara gwiazda
   temporaryStarCenter = actualStarCenter{1};
   %dopasowana wcze�niej gwiazda
   loopStarCenter = stars(i,:);
   loopStarCenter(loopStarCenter == ' ') = [];
   %dopasowana sekwencja
   alignment2 = matchedSeq(i,:);
   newSequences{i} = alignment2;
   newStarCenter = loopStarCenter;
   
   a = length(temporaryStarCenter);
   b = length(loopStarCenter);
   [counter1,counter2] = countGaps(temporaryStarCenter,loopStarCenter);
   seq1 = temporaryStarCenter;
   seq2 = loopStarCenter;
   j = 1;
   k = 1;
   
  
   while(j ~= (b))
       if(seq1(k) == seq2(j))
           if(seq1(k) == '-')
               disp('te same ale gap w seq1');
               nowaGwiazda = strcat(nowaGwiazda,'-');
               j = j-1;
           elseif(seq2(j) == '-')
               disp('te same ale gap w seq2');
                nowaGwiazda = strcat(nowaGwiazda,'-');
                k=k-1;
           else
              disp('te same i seq1 wrzu�');
              nowaGwiazda = strcat(nowaGwiazda,seq1(k));
           end 
       else
            if(seq1(k) == '-')
                disp('inne ale gap w seq1');
               nowaGwiazda = strcat(nowaGwiazda,'-');
               j=j-1;
            elseif(seq2(j)=='-')
                disp('inne ale gap w seq2');
              nowaGwiazda = strcat(nowaGwiazda,'-');
              k=k-1;
            end
       end
   k=k+1;
   j=j+1;
%nadpisywane s� centra gwiazd

   end%%koniec while
       actualStarCenter{1} = nowaGwiazda;
end
finalStarCenter = nowaGwiazda
ostatnie(matchedSeq,stars,finalStarCenter)

end

