function reading = getFromFile( )
%to jest m�j plik defaultowy do wczytywania
startingFolder = 'E:\Bioinformatyka\FASTA';  
if ~exist(startingFolder, 'dir')
    %je�li ten plik nie istnieje to szuka po folderze innego pliku
  startingFolder = pwd;
end
%%Pobieram nazw� pliku, kt�ry u�ytkownik wybra�
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
    disp('Nie wybrano pliku do wczytania');
    % U�ytkownik wcisn�� Anuluj
  return;
end
fullFileName = fullfile(folder, baseFileName);
%wczytywanie pliku fasta zwraca : Header i Sequence
reading = fileread(fullFileName);
   
end

