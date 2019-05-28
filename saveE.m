function [scoreToFile] = result(seq1,seq2,steps,score,match,mismatch,gap)
%nowa posta� sekwencji 1
alignment1 = '';
%posta� dopasowania - je�li element sekwencji 1 jest r�wny elementowi
%sekwencji 2 wy�wietla "|", w innym wypadku wy�wietla spacj�
alingner = '';
%nowa posta� sekwencji 2
alignment2 = '';
%to�samo��(zgodno��)
identity = 0;
%r�nica(niezgodno��)
gaps = 0;
%warunki pocz�kowe
n = 1,m = 1; 

for i = length(steps):-1:1  
     %je�li warto�� klucza z wektora zapami�tuj�cego drog� (steps) = 1
    if steps(i) == 1   
        % to dodj spacj� w alignment
        alingner = strcat(alingner," "); 
        %w sekwencji 1 dodaj "_"
        alignment1 = strcat(alignment1,'_');
        %w sekwencji 2 wpisz element sekwencji 2 
        alignment2 = strcat(alignment2,seq2(n));      
        %zwi�ksz pozycj� wiersza (Sekwencja 2)
        n = n + 1; 
        %zwi�ksz r�nic�(niezgodno��)
        gaps = gaps + 1;                        
        
    elseif steps(i) == 2                            
        %je�li warto�� z wektora zapami�tuj�cego drog� (steps) = 2
        %czyli elementty obu sekwencji s� zgodne
        if seq1(m) == seq2(n)  
        %w dopasowaniu dodaj "|" jako znak zgodno�ci
        alingner = strcat(alingner,'|'); 
        %zwi�ksz to�samo��(zgodno��)
        identity = identity + 1;
        else
        %je�li elementy obu sewencji nie s� r�wne to dodaj wstaw
        %spacj� do dopasowania
        alingner=strcat(alingner," "); 
        end                                  
        
        alignment1 = strcat(alignment1,seq1(m));      
        alignment2 = strcat(alignment2,seq2(n));  
        %zwi�ksz pozycj� wiersza (Sekwencja 2)
        n = n + 1;  
        %zwi�ksz pozycj� kolumny (Sekwencja 1)
        m = m + 1;
        
    elseif steps(i) == 3       
      %je�li warto�� z wektora zapami�tuj�cego drog� (steps) = 3 
      %dodaj spacj� do dopasowania
       alingner = strcat(alingner," ");  
       %wstaw "_" do sekwencji 2 
       alignment2 = strcat(alignment2,'_');
       %wstaw element sekwencji 1
       alignment1 = strcat(alignment1,seq1(m));
        %zwi�ksz pozycj� kolumny (Sekwencja 1)
       m = m + 1;   
       %zwi�ksz r�nic� (niedopasowanie)
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
 
 
 %'w' zapis do istniej�cego lub utworzonego pliku
 fid = fopen('matching.txt','w');
 fprintf(fid, '#Sequence1: %s\n#Sequence2: %s\n#Mode: %s\n#Score: %d\n#Length: %d\n#Match: %d\n#Mismatch: %d\n#Gap: %d\n#Identity: %s\n#Gaps: %s\n%s\n%s\n%s\n', ...
 seq1,seq2,mode,scoreToFile,lengthOf,match,mismatch,gap,identityToFile,gapsToFile,alignmnent);
 fclose(fid);
end

