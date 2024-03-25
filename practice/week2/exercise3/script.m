% Read the data file
fid = fopen('wing.dat', 'r');
data = textscan(fid, '%s', 'delimiter', '\n', 'whitespace', '');
fclose(fid);

disp(data);
