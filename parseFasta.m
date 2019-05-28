function [identifier,sequence ] = parseFasta(fastaContent)
%Funkcja s³u¿y do zamiany uzyskanego Fasta w struktury
%Pierwsza linia Fasta to odpowiednik identyfikatora
%Ka¿da kolejna linia to sekwencja, któr¹ ³¹czê w tablicê typu char
sequence= "";
C = splitlines(fastaContent);
identifier = C(1);
for i = 2 : length(C)
    sequence = sequence + C(i) ;
end

