function [seqs]= ostatnie(matchedSeq,stars,finalStarCenter)
%funkcja por�wnuje finaln� posta� centrum gwiazdy z elementami macierzy 
%stars , kt�re s� dopasowaniami z pierwotnym centrum gwiazdy
%nast�pnie generuje finalne sekwencje
%tok rozumowania:
%je�li element final taki sam jak element stars to patrz� co jest w elemencie
%matchseq i to wpisuje
%je�li w final lub stars s� gaps od razu wpisuj� do finalnej sekwencji
%przetrzymuj�c licznik elementu sekwencji
%je�li w samej sekwenjci s� gapy to te� je wpisuje przetrzymuj�c licznik
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
         disp('te same i seq wrzu� ale przed sprawdz czy nie ma tam gapa')
               if(seq1(k)=='-' && seq2(j)=='-') 
                    disp('w seq1 i seq2 by�y gap wi�c wpisz element z seq')
                   nowaS = strcat(nowaS,seq(m))  
                   xd=xd+2
               elseif(seq(m) == '-')
                    disp('w seq by� gap')
                    nowaS = strcat(nowaS,'-')
             % tu trzeba przetrzyma� licznik dla seq1 i seq2
                 k = k-1;
                 j = j-1;
               elseif(seq(m)~= seq1(k))
                   disp('seq inna ni� seq1 i seq2' )
                   m=m-1;
                   %zwi�ksz wszystkie liczniki
                  
               else
                
                disp('w seq nie by�o gap wpisz seq bo seq==seq1)')
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
                 disp('w seq by� gap')
                 nowaS = strcat(nowaS,'-')
                 % tu trzeba przetrzyma� licznik dla seq1 i seq2
                 k = k-1;
                 j = j-1;
             else

                 disp('w seq nie by�o gap wiec nie wpisuj nic bo seq~=seq1')
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

