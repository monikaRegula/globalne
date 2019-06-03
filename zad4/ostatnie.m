function [seqs]= ostatnie(matchedSeq,stars,finalStarCenter)
%funkcja porównuje finaln¹ postaæ centrum gwiazdy z elementami macierzy 
%stars , które s¹ dopasowaniami z pierwotnym centrum gwiazdy
%nastêpnie generuje finalne sekwencje
%tok rozumowania:
%jeœli element final taki sam jak element stars to patrzê co jest w elemencie
%matchseq i to wpisuje
%jeœli w final lub stars s¹ gaps od razu wpisujê do finalnej sekwencji
%przetrzymuj¹c licznik elementu sekwencji
%jeœli w samej sekwenjci s¹ gapy to te¿ je wpisuje przetrzymuj¹c licznik
%dla final i dla stars
seqs=[];

for i = 1:3
    nowaS='';  
    seq = matchedSeq(i,:);
    seq(seq == ' ')=[]
    seq1 = stars(i,:);
    seq1(seq1 == ' ') = []
    seq2 = finalStarCenter
    a = length(seq)
   [counter1,counter2] = countGaps(seq1,seq2)
   
   j = 1;
   k = 1;
   m = 1;
  xd = length(nowaS)
  disp('while')
   while(xd < a+counter1 + counter2)
     if(seq1(k) == seq2(j))
         disp('te same i seq wrzuæ ale przed sprawdz czy nie ma tam gapa')
               if(seq1(k)=='-' && seq2(j)=='-') 
                    disp('w seq1 i seq2 by³y gap wiêc wpisz element z seq')
                   nowaS = strcat(nowaS,seq(m))  
                   xd=xd+2
               elseif(seq(m) == '-')
                    disp('w seq by³ gap')
                    nowaS = strcat(nowaS,'-')
             % tu trzeba przetrzymaæ licznik dla seq1 i seq2
                 k = k-1;
                 j = j-1;
               elseif(seq(m)~= seq1(k))
                   disp('seq inna ni¿ seq1 i seq2' )
                   m=m-1;
                   %zwiêksz wszystkie liczniki
                  
               else
                
                disp('w seq nie by³o gap wpisz seq bo seq==seq1)')
                nowaS = strcat(nowaS,seq(m))
               end
           
     else
         if(seq1(k) == '-')
             disp('inne ale gap w seq1')
             nowaS = strcat(nowaS,'-')
             %tu przetrzymaj licznik dla seq2 i seq
             j = j-1;
             m = m-1;
         elseif(seq2(j)=='-')
             disp('inne ale gap w seq2')
             nowaS = strcat(nowaS,'-')
             %tu przetrzymja licznik dla seq1 i seq
             k = k-1;
             m = m-1;
             j;
         else
             disp('inne ale sprawdz czy gap w seq')
             if(seq(m) == '-')
                 disp('w seq by³ gap')
                 nowaS = strcat(nowaS,'-')
                 % tu trzeba przetrzymaæ licznik dla seq1 i seq2
                 k = k-1;
                 j = j-1;
             else

                 disp('w seq nie by³o gap wiec nie wpisuj nic bo seq~=seq1')
               end
            end
       end
   k = k+1
   j = j+1
   m = m+1  
     xd = length(nowaS)   
   end
  if(i == 3)
     seqs =[seqs,nowaS];
  else
     seqs =[seqs,nowaS,' '];   
    end

end

resultSeq = char(split(seqs,' '))

end

