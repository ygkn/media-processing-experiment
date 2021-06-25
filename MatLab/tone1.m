clear all;
clc;

Input = imread('LenaGray.jpg'); %ファイル名を変更する

Input = double(Input);
[Width, Height] = size(Input);

%%%%%%　ここの間で画像処理を行う　%%%%%%%%%%%%%%%%%%%%

for i=1:Width
    for j=1:Height

        Output(i, j) = min(255, 2 * Input(i, j));

    end;
end;


%%%%%%%%　ここまでの間で画像処理を行う　%%%%%%%%%%%%%%%


%%%%%% 画像の出力 (濃淡画像の場合，colormapも行う) %%%%%
imagesc(Output);
colormap('gray');

Output = uint8(Output);


%%%%%% 画像の保存 （保存ファイル名は'　'の中で記述）%%%%%
imwrite(Output, 'LenaOutput.bmp');

