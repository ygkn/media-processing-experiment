%% Labelling a binary image %%

%% Load image

W = imread('puzzle.jpg'); W1 = W; 
W = (W-min(W(:)))/(max(W(:))-min(W(:)));    % set min to 0, max to 1

%% close all figures;
close all;

%% Display original
W = double(W);
figure('NumberTitle','off','Name','Original');
imshow(W);

%% Get basic information
L = size(W,1);                              % L is image 'height'(number of roll)
K = size(W,2);                              % K is image 'width' (number of column)

%% Set Margins of the image to zeros
W(1,:) = 0; W(L,:) = 0; W(:,1) = 0; W(:,K) = 0;

%% Step 1: Initial Labelling

label = 100;                                 % set start label 
for y = 2 : L-1
    for x = 2 : K-1
        if W(y,x) == 1;
            w = W(y-1:y+1,x-1:x+1);
            maxw = max(w(:));
            if W(y,x-1) == 0 && maxw == 1
                W(y,x) = label;
                label = label + 1;
            elseif maxw >=1
                W(y,x) = maxw;
            end
        end
    end
end
Y = W;

%% Step 2: Unite different labels in each connected reagion

label_1 = 0;
label_2 = 0;
loop = 1;
while loop == 1
    for y = 2 : L-1
        for x = 2 : K-1
            if Y(y,x)~=0
                wY = Y(y-1:y+1,x-1:x+1);
                maxwY = max(wY(:));
                if Y(y,x) ~= maxwY;
                    label_1 = Y(y,x);
                    label_2 = maxwY;
                    loop = 1;
                    break;
                end
            else
                loop = 0;
            end
        end
        if loop == 1
            break
        end
    end
    for y = 2 : L-1
        for x = 2 : K-1
            if Y(y,x) == label_2
                Y(y,x) = label_1;
            end
        end
    end
end

%% Step 3: Reassign labels with integer starting from 1

label_max = max(Y(:));
labels = 0;
for label = 1 : label_max
    if sum(Y(:) == label) > 0;
        labels = labels + 1;
        for y = 2 : L-1
            for x = 2 : K-1
                if Y(y,x) == label
                    Y(y,x) = labels;
                end
            end
        end
    end
end

%% Show result in color
% create color map for display
map = zeros(labels+1,3);
for label = 2 : labels+1
    if rem(label,6) == 0
        map(label,:) = [0 , 0 , 1];
    elseif rem(label,6) == 1
        map(label,:) = [0 , 1 , 1];
    elseif rem(label,6) == 2
        map(label,:) = [0 , 1 , 0];
    elseif rem(label,6) == 3
        map(label,:) = [1 , 1 , 0];
    elseif rem(label,6) == 4
        map(label,:) = [1 , 0 , 0];
    elseif rem(label,6) == 5
        map(label,:) = [1 , 0 , 1];
    end
end

% Display labelled image using the colormap
figure('NumberTitle','off','Name','Labelled Result');
imshow(Y,[0,labels],'Colormap',map);