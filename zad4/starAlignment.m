function  starAlignment(nowaKolejnoscSek,match,mismatch,gap)
%dopasowania:
ds=[];
dss=[];
for i = 2:size(nowaKolejnoscSek,1)
starCenter = nowaKolejnoscSek(1,:);
starCenter(starCenter == ' ')= []
comparedSequence = nowaKolejnoscSek(i,:);
comparedSequence(comparedSequence == ' ')= []

[scoredMatrix,prawyRog] = globalMatching(starCenter,comparedSequence,match,mismatch,gap);
[steps] = traceback(scoredMatrix,starCenter,comparedSequence,match,mismatch,gap);
[alignment1, alignment2] = alignAfterMatching(steps,starCenter,comparedSequence);

%dopasowania
if(i == 4)
    ds =[ds,alignment2];
    dss= [dss, alignment1];
else
    ds =[ds,alignment2,' '];
    %centrum gwiazd
    dss= [dss, alignment1,' '];
end

end
disp('to s� alignment1 z dopasowania sekwencji s1,s2,s4  z starCenter(s3)')
matchedSeq = char(split(ds,' '))
disp('to s� alignment2 z dopasowania z starCenter(s3)')
stars = char(split(dss,' '))

checkGaps(starCenter,matchedSeq,stars)

end

