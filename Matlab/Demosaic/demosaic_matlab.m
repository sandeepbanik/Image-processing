function [R_est,G_est,B_est] = demosaic_matlab(rgbImage)
%% Parameters
    N = size(rgbImage,1);
    M = size(rgbImage,2);

    red_channel = rgbImage(:,:,1);
    green_channel = rgbImage(:,:,2);
    blue_channel = rgbImage(:,:,3);

%% CFA filter
    I = zeros(N,M);
    I(1:2:end,2:2:end) = red_channel(1:2:end,2:2:end);
    I(2:2:end,1:2:end) = blue_channel(2:2:end,1:2:end);
    I(1:2:end,1:2:end) = green_channel(1:2:end,1:2:end);
    I(2:2:end,2:2:end) = green_channel(2:2:end,2:2:end);   
    
%% Demosaic
    J = demosaic(uint8(I),'grbg');
    R_est = J(:,:,1);
    G_est = J(:,:,2);
    B_est = J(:,:,3);
end