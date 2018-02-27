function [R_est,G_est,B_est] = demosaic_difference_filter(rbgImage)
%% Parameters
    [N,M,~] = size(rbgImage);
    I = CFA_filter(rbgImage);
    R_pre = I(:,:,1);
    G_pre = I(:,:,2);
    B_pre = I(:,:,3);
%% Padding correction for borders
    R = [[R_pre(1:4,1:4);R_pre(1:end,1:4);R_pre(end-3:end,1:4)] [R_pre(1:4,1:end);R_pre;R_pre(end-3:end,1:end)] [R_pre(1:4,end-3:end);R_pre(1:end,end-3:end);R_pre(end-3:end,end-3:end)]];
    B = [[B_pre(1:4,1:4);B_pre(1:end,1:4);B_pre(end-3:end,1:4)] [B_pre(1:4,1:end);B_pre;B_pre(end-3:end,1:end)] [B_pre(1:4,end-3:end);B_pre(1:end,end-3:end);B_pre(end-3:end,end-3:end)]];
    G = [[G_pre(1:4,1:4);G_pre(1:end,1:4);G_pre(end-3:end,1:4)] [G_pre(1:4,1:end);G_pre;G_pre(end-3:end,1:end)] [G_pre(1:4,end-3:end);G_pre(1:end,end-3:end);G_pre(end-3:end,end-3:end)]];

%% Demosaic
    H_G = 0.25*[0 1 0;1 4 1;0 1 0];
    G_est = conv2(G,H_G,'same');
    R_est = zeros(N+8,M+8);
    B_est = zeros(N+8,M+8);

    for i=3:size(R_est,1)-2
        for j=3:size(R_est,2)-2
                if mod(i,2)==1 && mod(j,2)==0
                    B_est(i,j) = G_est(i,j) + 0.25*((B(i-1,j-1)-G_est(i-1,j-1)) + (B(i-1,j+1)-G_est(i-1,j+1)) +...
                                    (B(i+1,j-1)-G_est(i+1,j-1)) + (B(i+1,j+1)-G_est(i+1,j+1)));
                    R_est(i,j) = R(i,j);
                elseif mod(i,2)==0 && mod(j,2)==1
                    R_est(i,j) = G_est(i,j) + 0.25*((R(i-1,j-1)-G_est(i-1,j-1)) + (R(i-1,j+1)-G_est(i-1,j+1)) +...
                                    (R(i+1,j-1)-G_est(i+1,j-1)) + (R(i+1,j+1)-G_est(i+1,j+1)));
                    B_est(i,j) = B(i,j);
                else
                    B_est(i,j) = B(i,j);
                    R_est(i,j) = R(i,j);
                end
        end
    end


    for i=3:size(R_est,1)-2
        for j=3:size(R_est,2)-2
                if mod(i,2)==1 && mod(j,2)==1
                    R_est(i,j) = G(i,j) + 0.25*((R(i,j-1)-G_est(i,j-1)) + (R(i,j+1)-G_est(i,j+1)) +...
                                    (R_est(i-1,j)-G_est(i-1,j)) + (R_est(i+1,j)-G_est(i+1,j)));
                    B_est(i,j) = G(i,j) + 0.25*((B(i-1,j) - G_est(i-1,j)) + (B(i+1,j) - G_est(i+1,j)) + (B_est(i,j-1) - G_est(i,j-1)) + (B_est(i,j+1) - G_est(i,j+1)));
                elseif mod(i,2)==0 && mod(j,2)==0
                    B_est(i,j) = G(i,j) + 0.25*((B(i,j-1)-G_est(i,j-1)) + (B(i,j+1)-G_est(i,j+1)) +...
                                    (B_est(i-1,j)-G_est(i-1,j)) + (B_est(i+1,j)-G_est(i+1,j)));
                    R_est(i,j) = G(i,j) + 0.25*((R(i-1,j) - G_est(i-1,j)) + (R(i+1,j) - G_est(i+1,j)) +...
                                        (R_est(i,j-1) - G_est(i,j-1)) + (R_est(i,j+1) - G_est(i,j+1)));
                end
        end
    end
    R_est = R_est(5:end-4,5:end-4);
    G_est = G_est(5:end-4,5:end-4);
    B_est = B_est(5:end-4,5:end-4);
end

