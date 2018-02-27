function f_img = smt_img(img, window)

m = window;
n = m;
S = ones(m,n);

if length(size(img)) < 3
    B = img(:,:,1);
    B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];
    f_img = conv2(single(B), S, 'same');
    f_img = uint8(f_img/(m*n));
    f_img = f_img(m:end-m+1,n:end-n+1);
else
    f_img = zeros(size(img,1)+2*(m-1),size(img,2)+2*(n-1));
    I_est = zeros(size(img));
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    R = [[R(1:m-1,1:n-1);R(1:end,1:n-1);R(end-m+2:end,1:n-1)] [R(1:m-1,1:end);R;R(end-m+2:end,1:end)] [R(1:m-1,end-n+2:end);R(1:end,end-n+2:end);R(end-m+2:end,end-n+2:end)]];
    G = [[G(1:m-1,1:n-1);G(1:end,1:n-1);G(end-m+2:end,1:n-1)] [G(1:m-1,1:end);G;G(end-m+2:end,1:end)] [G(1:m-1,end-n+2:end);G(1:end,end-n+2:end);G(end-m+2:end,end-n+2:end)]];
    B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];
    f_img(:,:,1) = (conv2(single(R), S, 'same'));
    f_img(:,:,1) = uint8((f_img(:,:,1)/(m*n)));
    f_img(:,:,2) = (conv2(single(G), S, 'same'));
    f_img(:,:,2) = uint8((f_img(:,:,2)/(m*n)));
    f_img(:,:,3) = (conv2(single(B), S, 'same'));
    f_img(:,:,3) = uint8((f_img(:,:,3)/(m*n)));
    I_est(:,:,1) = f_img(m:end-m+1,n:end-n+1,1);
    I_est(:,:,2) = f_img(m:end-m+1,n:end-n+1,2);
    I_est(:,:,3) = f_img(m:end-m+1,n:end-n+1,3);
    f_img = zeros(size(img));
    f_img = uint8(I_est);
end

%     R = [[R(1:m-1,1:n-1);R(1:end,1:n-1);R(end-m+2:end,1:n-1)] [R(1:m-1,1:end);R;R(end-m+2:end,1:end)] [R(1:m-1,end-n+2:end);R(1:end,end-n+2:end);R(end-m+2:end,end-n+2:end)]];
%     G = [[G(1:m-1,1:n-1);G(1:end,1:n-1);G(end-m+2:end,1:n-1)] [G(1:m-1,1:end);G;G(end-m+2:end,1:end)] [G(1:m-1,end-n+2:end);G(1:end,end-n+2:end);G(end-m+2:end,end-n+2:end)]];
%     B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];

end