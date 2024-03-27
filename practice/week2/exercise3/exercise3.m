% Read from wing.dat
scriptPath = fileparts(mfilename('fullpath'));
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

% Compute the polynomial models
for degree=3:5
  fprintf("Polynomial model of degree %d\n", degree);
  T = zeros(length(t), degree + 1);
  for i = 0:q
    T(:, i + 1) = t.^i;
  end

  norm_w = T\y;
  disp('Weights returned by normal system:');
  disp(norm_w);

  % R = chol(T'*T); % Cholesky decomposition
  % u = R'\(T'*y); % Forward substitution
  % chol_w = R\u;
  % disp('Weights returned by Cholesky decomposition:');
  % disp(chol_w);

  [Q,R] = qr(T,0); % reduced QR decomposition
  qr_w = R\(Q'*y);
  disp('Weights returned by QR decomposition:');
  disp(qr_w);

  [U,S,V] = svd(T,0); 
  svd_w = V*(S\U'*y);

  disp('Weights returned by SVD decomposition:');
  disp(svd_w);

  fprintf("Residual %f\n", norm(T*norm_w - y, 2));
  fprintf("==================\n");
end

% Estimate the double derivative of f
estimated_f = zeros(41, 1);

for i=0:41
  num = 0;
  sum = 0;
  for j=1:n
    if t(j) == i
      num = num + 1;
      sum = sum + y(j);
    end
  end
  if num == 0
    estimated_f(i+1) = 0;
  else
    estimated_f(i+1) = sum/num;
  end
end

for i=1:41
  if estimated_f(i) == 0
    estimated_f(i) = (estimated_f(i-1)+estimated_f(i+1))/2;
  end
end

derivative_f = zeros(40, 1);
for i = 1:40
  derivative_f(i) = estimated_f(i+1) - estimated_f(i);
end

double_derivative_f = zeros(39, 1);
for i = 1:39
  double_derivative_f(i) = derivative_f(i+1) - derivative_f(i);
end

disp(double_derivative_f)