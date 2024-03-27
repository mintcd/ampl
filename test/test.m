% Given string
data_str = '1 0 9 2 17 3 25 8 33 16 41 22 49 27 57 29 65 33\n2 0 10 2 18 3 26 9 34 17 42 22 50 27 58 30 66 34\n3 1 11 2 19 4 27 9 35 18 43 23 51 28 59 30 67 34\n4 1 12 2 20 4 28 11 36 18 44 23 52 28 60 31 68 37\n5 1 13 2 21 4 29 13 37 19 45 24 53 28 61 31 69 37\n6 1 14 2 22 5 30 13 38 20 46 25 54 28 62 31 70 39\n7 1 15 2 23 6 31 15 39 20 47 25 55 28 63 32 71 41\n8 1 16 2 24 7 32 15 40 22 48 26 56 29 64 32';

% Split the string by newline character
lines = strsplit(data_str, '\n');

disp(lines)

% % Preallocate result array
% result = zeros(1, numel(lines) * 9);

% % Loop through each line and extract numbers
% idx = 1;
% for i = 1:numel(lines)
%     line = str2num(lines{i}); %#ok<ST2NM>
%     result(idx:idx+numel(line)-1) = line;
%     idx = idx + numel(line);
% end

% % Display the result
% disp(result);