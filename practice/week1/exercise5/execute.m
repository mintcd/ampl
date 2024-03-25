for n = 10:10:100
  data_path = 'D:\AMPL\week1\exercise5\exercise5.dat';
  data_content = fileread(data_path);

  data_content = regexprep(data_content, 'N\s*:=\s*\d+;', ['N := ' num2str(n) ';']);

  
  fid = fopen(data_path, 'w');
  fprintf(fid, '%s', data_content);
  fclose(fid);

  system('ampl D:\AMPL\week1\exercise5\exercise5.run');

  fid = fopen(sprintf('coords-%d.txt', n), 'r');
  data = textscan(fid, '(%f, %f)');
  fclose(fid);

  % Extract coordinates
  x = zeros(n+1, 1); % Preallocate x
  y = zeros(n+1, 1); % Preallocate y
  x(1:n) = data{1}.*cos(data{2});
  y(1:n) = data{1}.*sin(data{2});

  % Connect last point with the first one to form a closed polygon
  x(n+1) = x(1);
  y(n+1) = y(1);

  % Plot graph
  figure;
  plot(x, y, 'o-');
  xlabel('x');
  ylabel('y');
  title('Plot of Polygon');
  axis equal;

  saveas(gcf, sprintf('D:\\AMPL\\week1\\exercise5\\%d-gon.png', n));
end
