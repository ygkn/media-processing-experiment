clear all;
clc;

Input = imread('LenaGray.jpg'); %ファイル名を変更する

Input = double(Input);
[Width, Height] = size(Input);

th = 111

%%%%%%　ここの間で画像処理を行う　%%%%%%%%%%%%%%%%%%%%

for i=1:Width
    for j=1:Height

        if Input(i, j) > th
            Output(i, j) = 255;
        else
            Output(i, j) = 0;
        end

    end;
end;


%%%%%%%%　ここまでの間で画像処理を行う　%%%%%%%%%%%%%%%


%%%%%% 画像の出力 (濃淡画像の場合，colormapも行う) %%%%%
imagesc(Output);
colormap('gray');

Output = uint8(Output);


%%%%%% 画像の保存 （保存ファイル名は'　'の中で記述）%%%%%
imwrite(Output, 'mode.png');

