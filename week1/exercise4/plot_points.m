% Step 1: Read the text file
fileID = fopen('D:\AMPL\week1\exercise4\coords-100.txt', 'r');
data = textscan(fileID, '(%f,%f,%f)');
fclose(fileID);

% Step 2: Parse the data
x = data{1};
y = data{2};
z = data{3};

% Step 3: Plot the 3D graph
figure;
scatter3(x, y, z, 'filled');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Scatter Plot');

% Step 4: Export the plot as an image
print(gcf, '-dpng', 'D:\AMPL\week1\exercise4\3d_plot_100.png');
