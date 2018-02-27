
# coding: utf-8

# In[6]:


import numpy as np
import cv2
import os
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import img_processing_class


# In[8]:


def hist_data(img):
    hist = np.zeros((255,1))
    for x in range(0, 255, 1):
        hist[x] = np.sum(np.uint8(img)==x)
    return hist

def log_transform(Img, log_transform=None):
    if log_transform is None:
        log_transform = 1
    
    s = log_transform*np.log(np.ones(Img.shape) + Img)
    return s

def neg_tf(Img):
    neg_Img = (256-1)*np.ones(Img.shape) - Img
    return neg_Img

def power_tf(Img, gamma=None, power=None):
    if power is None:
        power = 1
    if gamma is None:
        gamma=1
    gamma_img = power*(np.power(Img, gamma))
    return gamma_img

def hist_eq(Img):
    hist = np.zeros((255,1))
    p_rk = np.zeros((255,1))
    temp = 0
    hist_img = np.zeros(Img.shape)
    for x in range(0, 255, 1):
        hist[x] = np.sum(np.uint8(Img)==x)
        temp = temp + 255*(hist[x]/(Img.shape[0]*Img.shape[1]))
        p_rk[x] = temp
        hist_idx = np.where(np.uint8(Img)==x)
        hist_img[hist_idx] = np.uint8(p_rk[x])
    return hist_img

