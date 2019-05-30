function checkGaps(starCenter,matchedSeq,stars)
%por�wnuj�centrum gwiazdy z wygenerowanymi dopasowaniami
%centrami gwiazdy ; ka�de nast�pne centrum gwiazdy jest pozosta�o�ci� z poprzedniej
%p�tli dopasowania
actualStarCenter{1} = starCenter;

for i = 1 : 3
   temporaryStarCenter = actualStarCenter{1}
   loopStarCenter = stars(i,:);
   loopStarCenter(loopStarCenter == ' ') = []
   alignment2 = matchedSeq(i,:);
   newSequences{i} = alignment2;
   newStarCenter = loopStarCenter;
   
   a = length(temporaryStarCenter);
   b = length(loopStarCenter);
   
   %kiedy r�ne s� d�ugo�ci starego centrum gwiazdy z dopasowaniami centrum
   %gwiazdy
   if(a ~= b)
        k = 1; 
        newStarCenter = '';
        %tak d�ugo jak dopasowanie 
        for j = 1:length(loopStarCenter)
            c = loopStarCenter(j)
            d = temporaryStarCenter(k)
            temporaryStarCenter(k)
            %kiedy element dopasowania jest  ni� element starej centrum
            %gwiazdy
            if(c ~= d )
               newStarCenter = strcat(newStarCenter, loopStarCenter(j));
               disp('inne d�ugo�ci loop i temporary')
                for l = 1:length(actualStarCenter)
                    new = actualStarCenter{l};
                    newW = [new(1:l), '-', new(l+1:end)];
                    actualStarCenter{l} = newW;
                end
            else
                 disp('te same d�ugo�ci loop i temporary')
                newStarCenter = strcat(newStarCenter, temporaryStarCenter(k));
                if (k ~= length(temporaryStarCenter))
                    k = k+1;
                end
                
            end
            
        end
        
   end
   
   %nadpisywane s� centra gwiazd
    actualStarCenter{1} = newStarCenter
   

end

