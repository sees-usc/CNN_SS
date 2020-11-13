# Inverting Subsurface Flow Data for Geologic Scenarios Selection with Convolutional Neural Networks
We provide an iterative two-step scheme for fast geologic scenario falsification. In the feature extraction step, a coarse scale inversion is done by using a hybrid PCA basis. In the feature recognition step, CNN is used to predict the relevances of each scenario and then the composition of the hybrid PCA basis is updated based on the prediction.  

<img src="https://github.com/AnyueJ/CNN_SS/blob/main/Image/WorkflowDetails.jpg" width="929" height="476">

We provide the training of CNN for a 2D fluvial dataset and a 3D four-faces dataset. We also provide the inversion codes in MATLAB where simulation is done through MRST.
## Prerequisites
Python 3.6

MATLAB

Tensorflow 1.13

The MATLAB Reservoir Simulation Toolbox (MRST)

## Data
Due to the large size of data files, the data files (realizations and PCA basis) are not uploaded. Please email me (anyuejia@usc.edu) for the access to them.

## Citation
Please cite our paper if you find the codes useful

## Acknowledgments
The authors acknowledge partial funding of this project by Energi Simulation Chair Program. The authors also thank Syamil Mohd Razak for helping build the three-dimensional case study for this work.
