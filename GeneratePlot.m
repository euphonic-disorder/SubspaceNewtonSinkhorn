figure;
axis equal;
hold on;
ha = annotation('arrow');  % store the arrow information in ha
ha.Parent = gca;           % associate the arrow the the current axes
ha.X = [1 1.5];          % the location in data units
ha.Y = [1 1.5];   

ha.LineWidth  = 1;          % make the arrow bolder for the picture
ha.HeadWidth  = 10;
ha.HeadLength = 10;

ha2 = annotation('arrow');  % store the arrow information in ha
ha2.Parent = gca;           % associate the arrow the the current axes
ha2.X = [1 1.5];          % the location in data units
ha2.Y = [1 0.1];   

ha2.LineWidth  = 1;          % make the arrow bolder for the picture
ha2.HeadWidth  = 10;
ha2.HeadLength = 10;

ha3 = annotation('arrow');  % store the arrow information in ha
ha3.Parent = gca;           % associate the arrow the the current axes
ha3.X = [1 1.5];          % the location in data units
ha3.Y = [1 1];   

ha3.LineWidth  = 1;          % make the arrow bolder for the picture
ha3.HeadWidth  = 10;
ha3.HeadLength = 10;
plot(1,1,'.', 'MarkerSize', 20)