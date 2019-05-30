function checkGaps(starCenter,matchedSeq,stars)
%porównujêcentrum gwiazdy z wygenerowanymi dopasowaniami
%centrami gwiazdy ; ka¿de nastêpne centrum gwiazdy jest pozosta³oœci¹ z poprzedniej
%pêtli dopasowania
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
   
   %kiedy ró¿ne s¹ d³ugoœci starego centrum gwiazdy z dopasowaniami centrum
   %gwiazdy
   if(a ~= b)
        k = 1; 
        newStarCenter = '';
        %tak d³ugo jak dopasowanie 
        for j = 1:length(loopStarCenter)
            c = loopStarCenter(j)
            d = temporaryStarCenter(k)
            temporaryStarCenter(k)
            %kiedy element dopasowania jest  ni¿ element starej centrum
            %gwiazdy
            if(c ~= d )
               newStarCenter = strcat(newStarCenter, loopStarCenter(j));
               disp('inne d³ugoœci loop i temporary')
                for l = 1:length(actualStarCenter)
                    new = actualStarCenter{l};
                    newW = [new(1:l), '-', new(l+1:end)];
                    actualStarCenter{l} = newW;
                end
            else
                 disp('te same d³ugoœci loop i temporary')
                newStarCenter = strcat(newStarCenter, temporaryStarCenter(k));
                if (k ~= length(temporaryStarCenter))
                    k = k+1;
                end
                
            end
            
        end
        
   end
   
   %nadpisywane s¹ centra gwiazd
    actualStarCenter{1} = newStarCenter
   

end

