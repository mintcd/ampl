% Read from wing.dat
dataPath = fullfile(scriptPath, 'wing.dat');

dataContent = fileread(dataPath);

matches = regexp(dataContent, '(\d+(\s+\d+)*)+', 'match');


n = str2num(matches{1});

t_lines = strsplit(matches{2}, '\n');
y_lines = strsplit(matches{3}, '\n');

t_data = regexp(matches{2}, '\d+(\s+\d+)', 'match');
y_data = regexp(matches{3}, '\d+(\s+\d+)', 'match');

t = zeros(n,1);
y = zeros(n,1);

for i = 1:n
  t_pair = strsplit(t_data{i}, " ");
  y_pair = strsplit(y_data{i}, " ");

  t(str2num(t_pair{1})) = str2num(t_pair{2}); %#ok<*ST2NM>
  y(str2num(y_pair{1})) = str2num(y_pair{2}); %#ok<*ST2NM>
end


% Define the range of x values
x = linspace(0, 41, 1000);

% Calculate y values using the logistic curve equation
y_logistic = 300 ./ (1 + (187/13) * exp(-0.1333*x));

% Plot the logistic curve
plot(x, y_logistic)
hold on

% Plot points given by arrays t and y
plot(t, y, 'ro', 'MarkerSize', 8)

% Add labels and title
title('Logistic Curve with Points')
xlabel('x')
ylabel('y')
legend('Logistic Curve', 'Points')
grid on
hold off
