function seq = validateSequence(seq)
seq = lower(seq)
for i= 1:length(seq)
   if ~(seq(i)=='A' || seq(i)=='T' || seq(i)=='C' || seq(i)=='G' || seq(i)=='U')
    error('There is no such nucleotide');
   end
end
end

