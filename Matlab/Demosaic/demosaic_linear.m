function [R_est,G_est,B_est] = demosaic_linear(rgbImage)
%% Parameters
    I = CFA_filter(rgbImage);
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);

%% Padding borders
    R = [[R(1:2,1:2);R(1:end,1:2);R(end-1:end,1:2)] [R(1:2,1:end);R;R(end-1:end,1:end)] [R(1:2,end-1:end);R(1:end,end-1:end);R(end-1:end,end-1:end)]];
    B = [[B(1:2,1:2);B(1:end,1:2);B(end-1:end,1:2)] [B(1:2,1:end);B;B(end-1:end,1:end)] [B(1:2,end-1:end);B(1:end,end-1:end);B(end-1:end,end-1:end)]];
    G = [[G(1:2,1:2);G(1:end,1:2);G(end-1:end,1:2)] [G(1:2,1:end);G;G(end-1:end,1:end)] [G(1:2,end-1:end);G(1:end,end-1:end);G(end-1:end,end-1:end)]];

%% Convolution filters
    H_G = [0 1 0;1 4 1;0 1 0];
    H_B = [1 2 1;2 4 2;1 2 1];

%% Demosaic linear
    G_est = 0.25*(conv2(G,H_G,'same'));
    R_est = 0.25*(conv2(R,H_B,'same'));
    B_est = 0.25*(conv2(B,H_B,'same'));

    R_est = R_est(3:end-2,3:end-2);
    G_est = G_est(3:end-2,3:end-2);
    B_est = B_est(3:end-2,3:end-2);

end
