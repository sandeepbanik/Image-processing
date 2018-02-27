%% Testing the CFA function
    clear;
    close all;
    clc;
    addpath('Demosaic');
    
%% Testing all demosaic algorithms

    % Load the image
    rgbImage = imread('test_img.jpg');
    
    % CFA bayer filter 
    I = CFA_filter(rgbImage);
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    
    % Testing the matlab function
    [R_m,G_m,B_m] = demosaic_matlab(rgbImage);
    I_mat = cat(3,R_m,G_m,B_m);
    imshow((I_mat));
    title('Demosaic matlab');
    fprintf('Matlab demosaic - press any button to continue \n');
    pause;

    % Testing the demosaic linear
    [R_l,G_l,B_l] = demosaic_linear(rgbImage);
    I_l = cat(3,R_l,G_l,B_l);
    imshow(uint8(I_l));
    title('Demosaic linear');
    fprintf('Demosaic linear filter - press any button to continue \n');
    pause;
    
    % Testing the demosaic difference filter
    close all;
    [R_d,G_d,B_d] = demosaic_difference_filter(rgbImage);
    I_d = cat(3,R_d,G_d,B_d);
    imshow(uint8(I_d));
    title('Demosaic difference filter');
    fprintf('Demosaic difference filter - press any button to continue \n');
    pause;
    
    % Testing the demosaic ratio filter
    close all;
    [R_r,G_r,B_r] = demosaic_ratio_filter(rgbImage);
    I_r = cat(3,R_r,G_r,B_r);
    imshow(uint8(I_r));
    title('Demosaic ratio filter');
    fprintf('Demosaic ratio filter - press any button to continue \n');
    pause;
    
    % Visualize CFA filter
    % Create an all black channel.
    close all;
    allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');

    % Create color versions of the individual color channels.
    just_red = cat(3, R, allBlack, allBlack);
    just_green = cat(3, allBlack, G, allBlack);
    just_blue = cat(3, allBlack, allBlack, B);

    % Recombine the individual color channels to create the original RGB image again.
    recombinedRGBImage = cat(3, R, G, B);

    % Visualize sparse matrix
    imshow(uint8(recombinedRGBImage));
    
