Input = imread('LenaRGB.bmp'); %�t�@�C������ύX����

Input = double(Input);
[Width, Height, dim] = size(Input);

a=0.9;

%%%%%%�@�����̊Ԃŉ摜�������s���@%%%%%%%%%%%%%%%%%%%%

    
for i=1:Height,
    for j = 1:Width
        %�@�e�����ւ̕ϊ�
        R(i, j) = Input(i, j, 1);
        G(i, j) = Input(i, j, 2);
        B(i, j) = Input(i, j, 3);
        
        
        
        
        
    end;
end;

%%%%%%%%%% �J���[�摜�ւ̕ϊ��@%%%%%%%%%%%%%%%%%

Output(:, :, 1) = R;
Output(:, :, 2) = G;
Output(:, :, 3) = B;

Output = uint8(Output);


%%%%%%%%�@�����܂ł̊Ԃŉ摜�������s���@%%%%%%%%%%%%%%%

%%%%%% �摜�̏o�� (�Z�W�摜�̏ꍇ�Ccolormap���s��) %%%%%
%imagesc(Output);
%colormap(gray);�@%�J���[�摜�̏ꍇ�C�R�����g�A�E�g����

%%%%%% �摜�̕ۑ� �i�ۑ��t�@�C������'�@'�̒��ŋL�q�j%%%%%
imwrite(Output, 'OutputRGB.jpg');

