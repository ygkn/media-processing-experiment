%%%% Template Matching Program %%%%
%% Imput Target Image

W = imread('historical_book_image_gray.jpg');        % import image (W)

%% get basic information of the Target Image
L = size(W,1);                      % L is image 'height'(number of roll)
K = size(W,2);                      % K is image 'width' (number of column)
DW = size(W,3);                      % DW is depth of image plane 1:gray, 3:color
if DW > 1
    W = rgb2gray(W);         % If color, convert to gray-scale image
end
%
W = double(W);                      % convert to double precision image
                                    % because max value of uint8 class is only 255
close all;   % close all figures
                                    
%% Imput Template Image                                   

%%T = imread('template_character_image_gray.jpg');   % import template image (T)
T = imread('query.jpg');
%% get basic information of the Templae Image
N = size(T,1);                      % N is template 'height'
M = size(T,2);                      % M is template 'width'
DT= size(T,3);
if DT >1 
    T=rgb2gray(T);           % If color, convert to gray-scale image
end
T = double(T);                      % convert to double precision image
     
ht=figure('NumberTitle','off','Name','Template');  % define figure window for the template image 
imshow(uint8(T));             % show template image T with uint8 class
h=figure('NumberTitle','off','Name','Result');
axes('Position',[0,0,1,1]);
imshow(uint8(W));            % show target image W

%% correlation coefficient template matching
Buff = 0;                           % Buff will be maximum matching value
X = 0;                              % X will be x position of maximum matching point
Y = 0;                              % Y will be y position of maximum matching point

Ta = 0;                             % Ta will be sum of T
Tb = 0;                             % Tb will be sum T^2
for i = 1 : M                       % i is looping for width
    for j = 1 : N                   % j is looping for height
        Ta = Ta + T(j,i);
        Tb = Tb + (T(j,i)*T(j,i));
    end
end

R = zeros(L-N+1,K-M+1);             % create R metrix, Normalized correlation value


for y = 1 :2: L-N+1                   % y is scan by vertical direction 
                                    % from 1 to 'image height' - 'template height' + 1
    for x = 1 :2: K-M+1               % y is scan by horizontal direction 
                                    % from 1 to 'image width' - 'template width' + 1
        WT = 0;                     % WT will be sum W * T
        Wa = 0;                     % Wa will be sum W
        Wb = 0;                     % Wb will be sum W^2
        for i = 1 : M
            for j = 1 : N
                WT = WT + (W(y+j-1,x+i-1)*T(j,i));
                Wa = Wa + (W(y+j-1,x+i-1));
                Wb = Wb + (W(y+j-1,x+i-1)*W(y+j-1,x+i-1));
            end
        end
        R(y,x) = (WT-(Wa*Ta/(M*N)))/sqrt((Wb-(Wa*Wa/(M*N)))*(Tb-(Ta*Ta/(M*N))));
                                    % correlation coefficient calculation
        if Buff < R(y,x)            % checking for maximum value
            Buff = R(y,x);          % Buff is maximum matching value
            X = x;                  % X is x position of maximum matching point
            Y = y;                  % Y is y position of maximum matching point
        end
        % Make regtangle around area that have score more than a value
        if R(y,x) > 0.75
            rectangle('Position',[x,y,M,N],'EdgeColor','y','LineWidth',1.5);
        elseif R(y,x) > 0.57
            rectangle('Position',[x,y,M,N],'EdgeColor','g','LineWidth',1.5);
        end
    end 
end
rectangle('Position',[X,Y,M,N],'EdgeColor','r','LineWidth',2);  % draw a red rectangle at the best match

