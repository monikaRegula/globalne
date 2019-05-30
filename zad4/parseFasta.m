function [identifier,sequence ] = parseFasta(fastaContent)
%Funkcja s�u�y do zamiany uzyskanego Fasta w struktury
%Pierwsza linia Fasta to odpowiednik identyfikatora
%Ka�da kolejna linia to sekwencja, kt�r� ��cz� w tablic� typu char
sequence= "";
C = splitlines(fastaContent);
identifier = C(1);
for i = 2 : length(C)
    sequence = sequence + C(i) ;
end

