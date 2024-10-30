%%% mohammad khalaji
%%% Mesh Square
%%% K.N.Toosi University of Technology
%% Basic Structures
clear 
close all
clc
%% Install Number of Desired Points - Cells 
n = 2;
NS = n.^2; % Number of Squares
NP = (n+1).^2; % Number of Points
NC = (n.^2).*2; % Number of Cells
%% Install Main Square and Equations
L = 1; % Define Length of Square
ND = sqrt(NS); % Number of Squars in Each Vectors
N = []; % Initial Number of Nodes (Empty)
EL = []; % Initial Number of Elements (Empty)
NI = 1; % Node Index (Numbering of Nodes)
EI = 1; % Element Index (Numbering of Elements)
for i = 1:ND+1 % For Begin From 0
    for j = 1:ND+1 % For Begin From 0
        N(end+1, :) = [(i-1)/ND*L, (j-1)/ND*L]; % Add new node
        % Check if a new square element can be defined
        if i < ND+1 && j < ND+1
            n1 = NI;
            n2 = NI + 1;
            n3 = NI + ND + 1;
            n4 = n3 + 1;
            % Define two triangles for each square
            EL(end+1, :) = [n1, n2, n4]; % Define Elements
            EL(end+1, :) = [n1, n4, n3]; % Define Elements
            EI = EI + 2; % Increment the element index for numbering
        end
        NI = NI + 1;
    end
end
triplot(EL, N(:,1), N(:,2),'blue','LineWidth',2);
axis equal
hold on
%% Calculate and Plot the Center of The Triangles and Number Them Using Verts
for i = 1:size(EL, 1)
    verts = N(EL(i, :), :);  % Get the Vertices of The Triangle
    cx = mean(verts(:,1));  % Calculate Center of Triangle
    cy = mean(verts(:,2));  % Calculate Center of Triangle  
    % Write Number at Center of Triangles
    text(cx, cy, num2str(i), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end
title('Mesh with Triangle Numbering','FontName','Times New Roman','FontSize',16);
xlabel('X','FontName','Times New Roman','FontSize',14,'FontWeight','bold');
ylabel('Y','FontName','Times New Roman','FontSize',14,'FontWeight','bold');
