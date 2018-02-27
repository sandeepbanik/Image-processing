function Img = lap_img(img_input)
m = 3;
n= 3;
S = [0 1 0;1 -4 1;0 1 0];
if length(size(img_input)) < 3
    B = img_input(:,:,1);
    B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];
    I_est = conv2(single(B), S, 'same');
    I_est = I_est(m:end-m+1,n:end-n+1);
    Img.normal = I_est;
    I_est = I_est - min(I_est(:));
    I_est = 255*(I_est/max(I_est(:)));
    I_est = uint8(I_est);
    Img.scale = I_est;
else
    I = zeros(size(img_input,1)+4,size(img_input,2)+4);
    I_est = zeros(size(img_input));
    R = img_input(:,:,1);
    G = img_input(:,:,2);
    B = img_input(:,:,3);
    R = [[R(1:m-1,1:n-1);R(1:end,1:n-1);R(end-m+2:end,1:n-1)] [R(1:m-1,1:end);R;R(end-m+2:end,1:end)] [R(1:m-1,end-n+2:end);R(1:end,end-n+2:end);R(end-m+2:end,end-n+2:end)]];
    G = [[G(1:m-1,1:n-1);G(1:end,1:n-1);G(end-m+2:end,1:n-1)] [G(1:m-1,1:end);G;G(end-m+2:end,1:end)] [G(1:m-1,end-n+2:end);G(1:end,end-n+2:end);G(end-m+2:end,end-n+2:end)]];
    B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];
    I(:,:,1) = conv2(single(R), S, 'same');
    I(:,:,2) = conv2(single(G), S, 'same');
    I(:,:,3) = conv2(single(B), S, 'same');
    I_est(:,:,1) = I(m:end-m+1,n:end-n+1,1);
    I_est(:,:,2) = I(m:end-m+1,n:end-n+1,2);
    I_est(:,:,3) = I(m:end-m+1,n:end-n+1,3);
    Img.normal = I_est;
    temp = I_est(:,:,1);
    temp = temp - min(temp(:));
    I_est(:,:,1) = 255*(temp/max(temp(:)));
    temp = I_est(:,:,2);
    temp = temp - min(temp(:));
    I_est(:,:,2) = 255*(temp/max(temp(:)));
    temp = I_est(:,:,3);
    temp = temp - min(temp(:));
    I_est(:,:,3) = 255*(temp/max(temp(:)));
    I_est = uint8(I_est);
    Img.scale = I_est;
end

end