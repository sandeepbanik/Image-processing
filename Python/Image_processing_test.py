# Library imports

import numpy as np
import cv2
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import Img_pr_fun

# Testing negative transformation
# The image is first load using opencv2 and check for the transformation

I = cv2.imread('test_img_2.jpg',0)
plt.imshow(I,cmap='gray')
plt.show()

img_1 = Img_pr_fun.neg_tf(I)
plt.imshow(img_1,cmap='gray')
plt.show()

# Testing log transformation 
# The log tranformation if best viewed in the range of fft components of the image
# The fft of the image is first computed and compared against the log transformation

# FFT image
f = np.fft.fft2(I)
fshift = np.fft.fftshift(f)

# FFT is increased by log function (standard)
magnitude_spectrum = 20*np.log(np.abs(fshift))

# FFT image
plt.imshow(np.abs(fshift),cmap="gray")
plt.show()

# Class assign
I_log = Img_pr_fun.log_transform(fshift)
plt.imshow(np.abs(I_log),cmap="gray")
plt.show()


# Testing for gamma correction
 
# In this part of the script the gamma correction is tested
# A different image is loaded 

# Load image
mri_img = cv2.imread('MRI-Brain.jpg',0)
plt.imshow(mri_img,cmap="gray")
plt.show()

# Class call
gamma_cor = Img_pr_fun.power_tf(mri_img)
plt.imshow(gamma_cor,cmap="gray")
plt.show()


# Testing histogram equilizer  
# This part of script is for testing the histogram equilizer

# Use previous image
I_hist = Img_pr_fun.hist_eq(I)
plt.imshow(I_hist,cmap="gray")
plt.show()

# Histogram plot
plt.step(range(0,255,1),Img_pr_fun.hist_data(I))
plt.show()
plt.step(range(0,255,1),Img_pr_fun.hist_data(I_hist))
plt.show()

