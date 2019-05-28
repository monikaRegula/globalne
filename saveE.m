function [scoreToFile] = result(seq1,seq2,steps,score,match,mismatch,gap)
%nowa postaæ sekwencji 1
alignment1 = '';
%postaæ dopasowania - jeœli element sekwencji 1 jest równy elementowi
%sekwencji 2 wyœwietla "|", w innym wypadku wyœwietla spacjê
alingner = '';
%nowa postaæ sekwencji 2
alignment2 = '';
%to¿samoœæ(zgodnoœæ)
identity = 0;
%ró¿nica(niezgodnoœæ)
gaps = 0;
%warunki pocz¹kowe
n = 1,m = 1; 

for i = length(steps):-1:1  
     %jeœli wartoœæ klucza z wektora zapamiêtuj¹cego drogê (steps) = 1
    if steps(i) == 1   
        % to dodj spacjê w alignment
        alingner = strcat(alingner," "); 
        %w sekwencji 1 dodaj "_"
        alignment1 = strcat(alignment1,'_');
        %w sekwencji 2 wpisz element sekwencji 2 
        alignment2 = strcat(alignment2,seq2(n));      
        %zwiêksz pozycjê wiersza (Sekwencja 2)
        n = n + 1; 
        %zwiêksz ró¿nicê(niezgodnoœæ)
        gaps = gaps + 1;                        
        
    elseif steps(i) == 2                            
        %jeœli wartoœæ z wektora zapamiêtuj¹cego drogê (steps) = 2
        %czyli elementty obu sekwencji s¹ zgodne
        if seq1(m) == seq2(n)  
        %w dopasowaniu dodaj "|" jako znak zgodnoœci
        alingner = strcat(alingner,'|'); 
        %zwiêksz to¿samoœæ(zgodnoœæ)
        identity = identity + 1;
        else
        %jeœli elementy obu sewencji nie s¹ równe to dodaj wstaw
        %spacjê do dopasowania
        alingner=strcat(alingner," "); 
        end                                  
        
        alignment1 = strcat(alignment1,seq1(m));      
        alignment2 = strcat(alignment2,seq2(n));  
        %zwiêksz pozycjê wiersza (Sekwencja 2)
        n = n + 1;  
        %zwiêksz pozycjê kolumny (Sekwencja 1)
        m = m + 1;
        
    elseif steps(i) == 3       
      %jeœli wartoœæ z wektora zapamiêtuj¹cego drogê (steps) = 3 
      %dodaj spacjê do dopasowania
       alingner = strcat(alingner," ");  
       %wstaw "_" do sekwencji 2 
       alignment2 = strcat(alignment2,'_');
       %wstaw element sekwencji 1
       alignment1 = strcat(alignment1,seq1(m));
        %zwiêksz pozycjê kolumny (Sekwencja 1)
       m = m + 1;   
       %zwiêksz ró¿nicê (niedopasowanie)
       gaps = gaps + 1;              
    end
    
end


 lengthOf = length(alignment1);
 alignmnent = [alignment1;alingner;alignment2]
 mode = 'distance';
 scoreToFile = score;
 identetityPercent = round((identity/lengthOf),2)*100;
 gapsPercent =  round((gaps/lengthOf),2)*100;
 identityToFile = strcat(num2str(identity),'/',num2str(lengthOf)," ",num2str(identetityPercent),'%');
 gapsToFile = strcat(num2str(gaps),'/',num2str(lengthOf)," ",num2str(gapsPercent),'%');
 
 
 %'w' zapis do istniej¹cego lub utworzonego pliku
 fid = fopen('matching.txt','w');
 fprintf(fid, '#Sequence1: %s\n#Sequence2: %s\n#Mode: %s\n#Score: %d\n#Length: %d\n#Match: %d\n#Mismatch: %d\n#Gap: %d\n#Identity: %s\n#Gaps: %s\n%s\n%s\n%s\n', ...
 seq1,seq2,mode,scoreToFile,lengthOf,match,mismatch,gap,identityToFile,gapsToFile,alignmnent);
 fclose(fid);
end

