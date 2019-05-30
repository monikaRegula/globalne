function fastaContent = getFromNCBI( identifier )
%%Funkcja dla wprowadzonego identyfiaktora (napis po znaku>)
%%zwraca informacje dotycz¹ce danego bia³ka oraz jego sekwencjê
URL='https://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
%%dziêki temu linkowi ³¹czê siê z baz¹ danych z baz¹  strony ncbi
%%National Center for Biotechnology Information
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end

