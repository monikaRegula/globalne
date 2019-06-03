function [alignment1,alignment2] = alignAfterMatching(steps,seq1,seq2)
%funkcja na podstawie podanch sekwencji oraz drogi z mapowania zwraca
%nowe postaci skewencji dopasowanych

%nowa postaæ centrum gwiazdy
alignment1 = '';
%nowa postaæ sekwencji dopasowywanej
alignment2 = '';

%warunki pocz¹tkowe
n = 1,m = 1; 
for i = length(steps):-1:1  
     %jeœli wartoœæ klucza z wektora zapamiêtuj¹cego drogê (steps) = 1
    if steps(i) == 1    
        %w sekwencji 1 dodaj "-"
        alignment1 = strcat(alignment1,'-');
        %w sekwencji 2 wpisz element sekwencji 2 
        alignment2 = strcat(alignment2,seq2(n));      
        %zwiêksz pozycjê wiersza (Sekwencja 2)
        n = n + 1;                     
        
    elseif steps(i) == 2     
        %jeœli wartoœæ z wektora zapamiêtuj¹cego drogê (steps) = 2
        %czyli elementty obu sekwencji s¹ zgodne
        alignment1 = strcat(alignment1,seq1(m));      
        alignment2 = strcat(alignment2,seq2(n));  
        %zwiêksz pozycjê wiersza (Sekwencja 2)
        n = n + 1;  
        %zwiêksz pozycjê kolumny (Sekwencja 1)
        m = m + 1;
        
    elseif steps(i) == 3       
      %jeœli wartoœæ z wektora zapamiêtuj¹cego drogê (steps) = 3 
       alignment2 = strcat(alignment2,'-');
       %wstaw element sekwencji 1
       alignment1 = strcat(alignment1,seq1(m));
        %zwiêksz pozycjê kolumny (Sekwencja 1)
       m = m + 1;                
    end
    
end

end

