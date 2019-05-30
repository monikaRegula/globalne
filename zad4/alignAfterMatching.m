function [alignment1,alignment2] = alignAfterMatching(steps,seq1,seq2)
%funkcja na podstawie podanch sekwencji oraz drogi z mapowania zwraca
%nowe postaci skewencji dopasowanych

%nowa posta� centrum gwiazdy
alignment1 = '';
%nowa posta� sekwencji dopasowywanej
alignment2 = '';

%warunki pocz�tkowe
n = 1,m = 1; 
for i = length(steps):-1:1  
     %je�li warto�� klucza z wektora zapami�tuj�cego drog� (steps) = 1
    if steps(i) == 1    
        %w sekwencji 1 dodaj "-"
        alignment1 = strcat(alignment1,'-');
        %w sekwencji 2 wpisz element sekwencji 2 
        alignment2 = strcat(alignment2,seq2(n));      
        %zwi�ksz pozycj� wiersza (Sekwencja 2)
        n = n + 1;                     
        
    elseif steps(i) == 2     
        %je�li warto�� z wektora zapami�tuj�cego drog� (steps) = 2
        %czyli elementty obu sekwencji s� zgodne
        if seq1(m) == seq2(n)  
        alignment1 = strcat(alignment1,seq1(m));      
        alignment2 = strcat(alignment2,seq2(n)); 
        else
        %je�li elementy obu sewencji nie s� r�wne to dodaj wstaw
        alignment1 = strcat(alignment1,seq1(m));      
        alignment2 = strcat(alignment2,'-'); 
        end    
        %zwi�ksz pozycj� wiersza (Sekwencja 2)
        n = n + 1;  
        %zwi�ksz pozycj� kolumny (Sekwencja 1)
        m = m + 1;
        
    elseif steps(i) == 3       
      %je�li warto�� z wektora zapami�tuj�cego drog� (steps) = 3 
       alignment2 = strcat(alignment2,'-');
       %wstaw element sekwencji 1
       alignment1 = strcat(alignment1,seq1(m));
        %zwi�ksz pozycj� kolumny (Sekwencja 1)
       m = m + 1;                
    end
    
end

end

