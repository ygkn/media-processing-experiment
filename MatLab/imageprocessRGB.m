Input = imread('LenaRGB.bmp'); %ファイル名を変更する

Input = double(Input);
[Width, Height, dim] = size(Input);

a=0.9;

%%%%%%　ここの間で画像処理を行う　%%%%%%%%%%%%%%%%%%%%

    
for i=1:Height,
    for j = 1:Width
        %　各成分への変換
        R(i, j) = Input(i, j, 1);
        G(i, j) = Input(i, j, 2);
        B(i, j) = Input(i, j, 3);
        
        
        
        
        
    end;
end;

%%%%%%%%%% カラー画像への変換　%%%%%%%%%%%%%%%%%

Output(:, :, 1) = R;
Output(:, :, 2) = G;
Output(:, :, 3) = B;

Output = uint8(Output);


%%%%%%%%　ここまでの間で画像処理を行う　%%%%%%%%%%%%%%%

%%%%%% 画像の出力 (濃淡画像の場合，colormapも行う) %%%%%
%imagesc(Output);
%colormap(gray);　%カラー画像の場合，コメントアウトする

%%%%%% 画像の保存 （保存ファイル名は'　'の中で記述）%%%%%
imwrite(Output, 'OutputRGB.jpg');

