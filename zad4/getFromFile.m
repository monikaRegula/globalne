function reading = getFromFile( )
%to jest mój plik defaultowy do wczytywania
startingFolder = 'E:\Bioinformatyka\FASTA';  
if ~exist(startingFolder, 'dir')
    %jeœli ten plik nie istnieje to szuka po folderze innego pliku
  startingFolder = pwd;
end
%%Pobieram nazwê pliku, który u¿ytkownik wybra³
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
    disp('Nie wybrano pliku do wczytania');
    % U¿ytkownik wcisn¹³ Anuluj
  return;
end
fullFileName = fullfile(folder, baseFileName);
%wczytywanie pliku fasta zwraca : Header i Sequence
reading = fileread(fullFileName);
   
end

