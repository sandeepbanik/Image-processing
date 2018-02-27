%% Image processing example
    clear;
    close all;
    clc;
    addpath('Image processing');
    
%% Data input
    img_clr = imread('test_img.jpg');
    img_gray = (rgb2gray(img_clr));

%% Test toolbox

% Image smoothing with window of 3x3
    test_img = IMG_process(img_gray);
    window = 3;
    [smt_img] = test_img.smoothing(window);
    figure;
    imshow(smt_img);
    title('Image smoothing');
    fprintf('Image smoothing - Press any key to continue \n');
    pause;
    
% Image smoothing using diagonal entries of window size 3x3
    close all;
    test_img2 = IMG_process(img_clr);
    window = 3;
    [smt_img2] = test_img2.smoothing(window);
    figure;
    imshow(smt_img2);
    title('Image smoothing2');
    fprintf('Image smoothing2 -Press any key to continue \n');
    pause;
    
% Loop the smoothing if required 
    close all;
    t = 1;
    temp_img = smt_img2;
    while t <= 1
        sh = lap2_img(temp_img);
        s_img = uint8(temp_img) - uint8(sh.normal);
        temp_img = s_img;
        t = t + 1;
    end
    figure;
    imshow(smt_img2);
    title('Image smoothing loop');
    fprintf('Image smoothing loop -Press any key to continue \n');
    pause;
    
% Sharpen image 
    close all;
    test_img3 = IMG_process(smt_img);
    sharp_img = test_img3.sharpen2;
    figure;
    imshow(sharp_img);
    title('Image sharpen');
    fprintf('Image sharpen -Press any key to continue \n');
    pause;
    
% Sharpen image 2 
    close all;
    test_img4 = IMG_process(smt_img2);
    sharp_img2 = test_img4.sharpen;
    figure;
    imshow(sharp_img2);
    title('Image sharpen');
    fprintf('Image sharpen 2 -Press any key to continue \n');
    pause;
    
% Unsharpen mask  
    close all;
    test_img5 = IMG_process(smt_img);
    unsharp_img = test_img5.unsharp_mask;
    figure;
    imshow(unsharp_img);
    title('Image unsharpen mask');
    fprintf('Image unsharp mask - Press any key to continue \n');
    pause;

% Highboost mask  
    close all;
    boost_img = test_img5.high_boost([],5);
    figure;
    imshow(boost_img);
    title('Boost image');
    fprintf('Image high boost - Press any key to continue \n');
    pause;

% Sobel filter  
    close all;
    img_lens = imread('test_img.jpg');
    img_gray = (rgb2gray(img_lens));
    test_img6 = IMG_process(img_gray);
    grad_img = test_img6.sobel_filt;
    figure;
    imshow(grad_img);
    title('Image sobel');
    fprintf('Image sobel filter - Press any key to continue \n');
    pause;
    
% Laplacian of image
    close all;
    img_ish = imread('test_img.jpg');
    test_img7 = IMG_process(img_ish);
    grad_img2 = test_img7.laplacian;
    figure;
    imshow(grad_img2.scale);
    title('Image laplacian');
    fprintf('Image laplacian');
    
    