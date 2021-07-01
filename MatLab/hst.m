clear all;
clc;

Input = imread('LenaGray.jpg'); %ファイル名を変更する

Input = double(Input);
[Width, Height] = size(Input);

hst = zeros(1, 256);

%%%%%%　ここの間で画像処理を行う　%%%%%%%%%%%%%%%%%%%%

for i=1:Width
    for j=1:Height

        hst(Input(i, j) + 1) = hst(Input(i, j) + 1) + 1;

    end;
end;


%%%%%%%%　ここまでの間で画像処理を行う　%%%%%%%%%%%%%%%

