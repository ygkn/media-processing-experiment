%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spatial Filtering with a Convolution Kernel %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

% Definition of the Kernel
W = [1/9,1/9,1/9; % Smoothing filter
     1/9,1/9,1/9;
     1/9,1/9,1/9];
%
%W = [1,0,-1; % Prewitt horizontal gradient filter
%     1,0,-1;
%     1,0,-1];
%
%W = [0,1,0;  % Laplacian Filter
%     1,-4,1;
%     0,1,0];

F = imread('LenaGray.jpg'); % Input Image
F = im2double(F);

w = (size(W,1)-1)/2; % Get filter size
G = ones(size(F));  % Definition of Output Image
for i = 1+w : 1 : size(F,1)-w
    for j = 1+w : 1 : size(F,2)-w
        d = 0;
        for n = -w : 1 : w
            for m = -w : 1 : w
                d = d + (F(i+n,j+m)*W(n+w+1,m+w+1));
            end
        end
        G(i,j) = d;
    end
end

figure;
subplot(1,2,1), imshow(F);
title(sprintf('Original Image'));
subplot(1,2,2), imshow(G);
title(sprintf('Filtered Image'));
%
imwrite(G, 'mean.png'); %Output the result of filtering.
%

