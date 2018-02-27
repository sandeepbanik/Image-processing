function M = sob_filter(img_input)
m = 3;
n= 3;
S1 = [-1 -2 -1;0 0 0;1 2 1];
S2 = [-1 0 1;-2 0 2;-1 0 1];
if length(size(img_input)) < 3
    B = img_input(:,:,1);
    B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];
    I_est = conv2(single(B), S1, 'same');
    S1_est = I_est(m:end-m+1,n:end-n+1);
    I_est = conv2(single(B), S2, 'same');
    S2_est = I_est(m:end-m+1,n:end-n+1);
    M = uint8(abs(S1_est) + abs(S2_est));
else
    I = zeros(size(img_input,1)+4,size(img_input,2)+4);
    I_est = zeros(size(img_input));
    R = img_input(:,:,1);
    G = img_input(:,:,2);
    B = img_input(:,:,3);
    R = [[R(1:m-1,1:n-1);R(1:end,1:n-1);R(end-m+2:end,1:n-1)] [R(1:m-1,1:end);R;R(end-m+2:end,1:end)] [R(1:m-1,end-n+2:end);R(1:end,end-n+2:end);R(end-m+2:end,end-n+2:end)]];
    G = [[G(1:m-1,1:n-1);G(1:end,1:n-1);G(end-m+2:end,1:n-1)] [G(1:m-1,1:end);G;G(end-m+2:end,1:end)] [G(1:m-1,end-n+2:end);G(1:end,end-n+2:end);G(end-m+2:end,end-n+2:end)]];
    B = [[B(1:m-1,1:n-1);B(1:end,1:n-1);B(end-m+2:end,1:n-1)] [B(1:m-1,1:end);B;B(end-m+2:end,1:end)] [B(1:m-1,end-n+2:end);B(1:end,end-n+2:end);B(end-m+2:end,end-n+2:end)]];
    I(:,:,1) = conv2(single(R), S1, 'same');
    I(:,:,2) = conv2(single(G), S1, 'same');
    I(:,:,3) = conv2(single(B), S1, 'same');
    I_est(:,:,1) = I(m:end-m+1,n:end-n+1,1);
    I_est(:,:,2) = I(m:end-m+1,n:end-n+1,2);
    I_est(:,:,3) = I(m:end-m+1,n:end-n+1,3);
    S1_est = I_est;
    I(:,:,1) = conv2(single(R), S2, 'same');
    I(:,:,2) = conv2(single(G), S2, 'same');
    I(:,:,3) = conv2(single(B), S2, 'same');
    I_est(:,:,1) = I(m:end-m+1,n:end-n+1,1);
    I_est(:,:,2) = I(m:end-m+1,n:end-n+1,2);
    I_est(:,:,3) = I(m:end-m+1,n:end-n+1,3);
    S2_est = I_est;
    M = uint8(abs(S1_est) + abs(S2_est));
end

end