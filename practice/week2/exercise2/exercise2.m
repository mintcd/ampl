% Specify the paths
scriptPath = fileparts(mfilename('fullpath'));

amplScriptPath = fullfile(scriptPath, 'exercise2.run');
solutionPath = fullfile(scriptPath, 'solution.out');
optimalPointPath = fullfile(scriptPath, 'optimal-point.txt');

% Construct the AMPL run file
optimalPointPath = strrep(optimalPointPath, '\', '/');

amplScript = [
            'option solver knitro;\n',  ... 
            'var x{1..2} := 0;\n', ...
            'minimize f:\n', ...
            '    (x[1]*(1-x[2]^3) - 2.625)^2\n', ...
            '  + (x[1]*(1-x[2]^2) - 2.25)^2\n', ...
            '  + (x[1]*(1-x[2]) - 1.5)^2;\n', ...
            'solve;\n', ...
            sprintf('printf "Optimal value printed by user:\\\\n" > %s;\n', optimalPointPath), ...
            sprintf('printf "(%%%%.6f, %%%%.6f)", x[1], x[2] > %s;\n', optimalPointPath)
            ];

amplFile = fopen(amplScriptPath, 'w');
fprintf(amplFile, amplScript);
fclose(amplFile);


% Execute AMPL script
system(['ampl ', amplScriptPath, '>', solutionPath]);

% Read the optimal-value.txt file
outputFilePath = fullfile(scriptPath, 'optimal-point.txt');
outputContent = fileread(outputFilePath);

% Extract optimal point using regular expressions
matches = regexp(outputContent, '\((-?\d+\.\d+), (-?\d+\.\d+)\)', 'tokens');

if isempty(matches)
  error('Optimal point not found in the file.');
end

x = str2double(matches{1});

disp("The optimal point x:")
disp(x)

% Check if the optimal point is stationary
grad_f = zeros(1,2);

grad_f(1) =  2 * (1 - x(2)^3) * (x(1)*(1-x(2)^3) - 2.625) ...
           + 2 * (1 - x(2)^2) * (x(1)*(1-x(2)^2) - 2.25)  ...
           + 2 * (1 - x(2))   * (x(1)*(1-x(2))   - 1.5);

grad_f(2) = - 6 * x(1) * x(2)^2 * (x(1)*(1 - x(2)^3) - 2.625) ...
            - 4 * x(1) * x(2)   * (2.25 - x(1)*(1 - x(2)^2))  ... 
            - 2 * x(1) * x(2)   * (1.5  - x(1)*(1 - x(2)));

disp("The gradient of f:")
disp(grad_f)

% Analyze the Hessian of f
hess_f = zeros(2,2);

hess_f(1,1) = 2 * (1 - x(2)^3)^2 + 2 * (1 - x(2)^2)^2 + 2 * (1 - x(2))^2;
hess_f(1,2) = 2 * (-6*x(1)*x(2)^2*(1-x(2)^3) + 2.625*3*x(2)^2) ...
            + 2 * (-4*x(1)*x(2)*  (1-x(2)^2) + 2.25*2*x(2))    ...
            + 2 * (-2*x(1)*       (1-x(2))  +  1.5);           ...
hess_f(2,1) = hess_f(1,2);
hess_f(2,2) = 6*x(1)*x(2) * (3*x(1)*x(2)^3 - 2*x(1)*(1-x(2)^3) - 5.25) ...
            - 0;