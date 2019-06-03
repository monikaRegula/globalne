function everyWithEvery (seq1,seq2,seq3,seq4,match,mismatch,gap)
%funkcja tworzy macierz scor�w przy por�wnaniu ka�dej sekwencji z ka�d�
ALLSEQ = [seq1,'*' seq2,'*',seq3,'*',seq4];
%tworz� tablic� z osobnymi sekwencjami
A = char(split(ALLSEQ,'*'))
disp('kazdaZKazda');

%prealokacja tabeli
rightCorner = zeros(4);
%p�tla przeprowadza dopasowania globalne dla wszystkich sekwencji
for i = 1:4
    for j = 1:4
        [scoredMatrix,rightCorner] = globalMatching(A(i,:),A(j,:),match,mismatch,gap);
        scores(i,j) = rightCorner;
        if(i == j)
             scores(i,j) = 0;
        end 
    end
end

scores

%zagnie�d�ona funkcja do sumowania punktacji po wierszach
sumScoresByRow(scoredMatrix,scores,A,match,mismatch,gap)

end


% %tutaj kod �eby nie robi� dopasowania globalnego dla ca�ej macierzy
%po co powtarza� mo�na wrzuci� odbicie lustrzane od przek�tnej
%j = 4;
% for i = 1:4
%     for j = 1:j
%         prawyRog(i,j) = globalMatching(A(i,:),A(j,:),match,mismatch,gap);
%         mirrorReflect = rot90(fliplr(prawyRog),-1);
%     end  
%     j = j-1;
% end
%aby po��czyc dwie macierze wzgl�dem wsp�lnej przek�tnej musz�
%z jednej macierzy usun�c pozosta�e elementy
%usuwam z odbicia lustrzanego ca�y wiersz 1.
% mirrorReflect(1,:)=[];
%usuwam z odbicia lustrzanego ca�� kolumn� 1.
% mirrorReflect(:,1)=[];
%w macierzy punktacji dostawiam warto�ci z odbicia lustrzanego:
% prawyRog(4,4)= mirrorReflect(3,3) ;
% prawyRog(4,3)= mirrorReflect(3,2); 
% prawyRog(4,2)= mirrorReflect(3,1); 
% prawyRog(3,4)= mirrorReflect(2,3); 
% prawyRog(3,3)= mirrorReflect(2,2);
% prawyRog(2,4)= mirrorReflect(1,3);
% prawyRog





