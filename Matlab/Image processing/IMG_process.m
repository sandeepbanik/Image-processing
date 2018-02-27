classdef IMG_process
    properties
        Img
    end
    methods
        function ip =  IMG_process(image)
            if nargin >= 1
                ip.Img = image;
            end
        end
        function f_img = smoothing(obj, window)
            if ~exist('window','var')
               window = 3; 
            end
            f_img = smt_img(obj.Img, window);
        end
        function f_img = laplacian(obj)
            f_img = lap_img(obj.Img);
        end
        function f_img = laplacian2(obj)
            f_img = lap2_img(obj.Img);
        end
        function f_img = sharpen(obj)
            s_img = lap_img(obj.Img);
            f_img = uint8(obj.Img) - uint8(s_img.normal);
        end
        function f_img = sharpen2(obj)
            s_img = lap2_img(obj.Img);
            f_img = uint8(obj.Img) - uint8(s_img.normal);
        end
        function f_img = unsharp_mask(obj, window)
            if ~exist('window','var') || isempty(window)
               window = 3; 
            end
            s_img = smt_img(obj.Img, window);
            g_img = obj.Img - s_img;
            f_img = uint8((obj.Img) + (g_img));
        end
        function f_img = high_boost(obj, window, k)
            if ~exist('window','var') || isempty(window)
               window = 3; 
            end
            if ~exist('k','var') || isempty(k)
               k = 1; 
            end
            s_img = smt_img(obj.Img, window);
            g_img = obj.Img - s_img;
            f_img = uint8((obj.Img) + k*(g_img));
        end
        function f_img = sobel_filt(obj)
            f_img = sob_filter(obj.Img);
        end
    end
end