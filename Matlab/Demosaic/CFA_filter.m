function I = CFA_filter(rgbImage)
%% Parameters
    N = size(rgbImage,1);
    M = size(rgbImage,2);

    red_channel = rgbImage(:,:,1);
    green_channel = rgbImage(:,:,2);
    blue_channel = rgbImage(:,:,3);

%% CFA filter
    I = zeros(N,M,3);
    I(1:2:end,2:2:end,1) = red_channel(1:2:end,2:2:end);
    I(2:2:end,1:2:end,3) = blue_channel(2:2:end,1:2:end);
    I(1:2:end,1:2:end,2) = green_channel(1:2:end,1:2:end);
    I(2:2:end,2:2:end,2) = green_channel(2:2:end,2:2:end);
end