function fastaContent = getFromNCBI( identifier )
%%Funkcja dla wprowadzonego identyfiaktora (napis po znaku>)
%%zwraca informacje dotycz�ce danego bia�ka oraz jego sekwencj�
URL='https://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
%%dzi�ki temu linkowi ��cz� si� z baz� danych z baz�  strony ncbi
%%National Center for Biotechnology Information
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end

