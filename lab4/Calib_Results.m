% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 515.059545651106646 ; 568.540009874346083 ];

%-- Principal point:
cc = [ 318.111510630792793 ; 242.633044144269888 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.159105092559940 ; -0.484039598571171 ; -0.003707782626178 ; 0.000859498926523 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.811727510045966 ; 3.145574338418172 ];

%-- Principal point uncertainty:
cc_error = [ 3.747588853038556 ; 3.423527735934959 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.021973631348226 ; 0.090754275429315 ; 0.002517114051715 ; 0.003267148064699 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.028215e+00 ; -2.139607e+00 ; 5.680716e-01 ];
Tc_1  = [ 6.480048e+01 ; 3.871043e+01 ; 2.014209e+02 ];
omc_error_1 = [ 4.977851e-03 ; 6.791680e-03 ; 1.250583e-02 ];
Tc_error_1  = [ 1.475584e+00 ; 1.237967e+00 ; 1.277642e+00 ];

%-- Image #2:
omc_2 = [ 2.129852e+00 ; -2.203063e+00 ; 2.207695e-01 ];
Tc_2  = [ 6.463179e+01 ; 3.784875e+01 ; 2.177080e+02 ];
omc_error_2 = [ 6.710154e-03 ; 7.863464e-03 ; 1.586236e-02 ];
Tc_error_2  = [ 1.596971e+00 ; 1.336563e+00 ; 1.462809e+00 ];

%-- Image #3:
omc_3 = [ 2.248232e+00 ; -1.847300e+00 ; 2.894579e-01 ];
Tc_3  = [ 5.748488e+01 ; 5.193633e+01 ; 2.143602e+02 ];
omc_error_3 = [ 6.692905e-03 ; 6.904572e-03 ; 1.413524e-02 ];
Tc_error_3  = [ 1.583195e+00 ; 1.332653e+00 ; 1.497247e+00 ];

%-- Image #4:
omc_4 = [ 2.062191e+00 ; -2.039608e+00 ; 1.775907e-01 ];
Tc_4  = [ 5.440519e+01 ; 3.461410e+01 ; 1.755549e+02 ];
omc_error_4 = [ 5.537480e-03 ; 6.687040e-03 ; 1.278861e-02 ];
Tc_error_4  = [ 1.290696e+00 ; 1.083059e+00 ; 1.200569e+00 ];

%-- Image #5:
omc_5 = [ 2.224589e+00 ; -2.032608e+00 ; 6.263937e-01 ];
Tc_5  = [ 6.180574e+01 ; 5.199207e+01 ; 2.221717e+02 ];
omc_error_5 = [ 5.642614e-03 ; 6.766298e-03 ; 1.327119e-02 ];
Tc_error_5  = [ 1.625013e+00 ; 1.363042e+00 ; 1.400712e+00 ];

%-- Image #6:
omc_6 = [ -2.036480e+00 ; -2.334566e+00 ; 2.454828e-01 ];
Tc_6  = [ -4.794071e+01 ; -5.954373e+01 ; 2.313498e+02 ];
omc_error_6 = [ 7.505996e-03 ; 8.088983e-03 ; 1.586319e-02 ];
Tc_error_6  = [ 1.691052e+00 ; 1.391533e+00 ; 1.448878e+00 ];

%-- Image #7:
omc_7 = [ -1.860958e+00 ; -1.945574e+00 ; -6.723982e-01 ];
Tc_7  = [ -3.386194e+01 ; -4.726143e+01 ; 1.722304e+02 ];
omc_error_7 = [ 4.425886e-03 ; 7.208192e-03 ; 1.064218e-02 ];
Tc_error_7  = [ 1.280586e+00 ; 1.052295e+00 ; 1.236688e+00 ];

%-- Image #8:
omc_8 = [ -2.196310e+00 ; -1.968633e+00 ; -7.505992e-01 ];
Tc_8  = [ -3.038993e+01 ; -3.839766e+01 ; 1.640128e+02 ];
omc_error_8 = [ 4.572551e-03 ; 7.090452e-03 ; 1.190566e-02 ];
Tc_error_8  = [ 1.220186e+00 ; 9.902498e-01 ; 1.206902e+00 ];

%-- Image #9:
omc_9 = [ -1.533014e+00 ; -1.868488e+00 ; 3.155127e-01 ];
Tc_9  = [ -1.352664e+01 ; -8.252487e+01 ; 2.608956e+02 ];
omc_error_9 = [ 5.829215e-03 ; 6.901994e-03 ; 9.806175e-03 ];
Tc_error_9  = [ 1.934313e+00 ; 1.566459e+00 ; 1.460839e+00 ];

%-- Image #10:
omc_10 = [ -1.619153e+00 ; -1.755971e+00 ; 2.990851e-01 ];
Tc_10  = [ -4.282346e+01 ; -7.295944e+01 ; 2.357560e+02 ];
omc_error_10 = [ 5.894765e-03 ; 6.162408e-03 ; 9.130362e-03 ];
Tc_error_10  = [ 1.746406e+00 ; 1.417795e+00 ; 1.327348e+00 ];

%-- Image #11:
omc_11 = [ -2.007591e+00 ; -2.018541e+00 ; -9.249234e-02 ];
Tc_11  = [ -3.671692e+01 ; -5.312540e+01 ; 2.026202e+02 ];
omc_error_11 = [ 6.201127e-03 ; 7.700953e-03 ; 1.330830e-02 ];
Tc_error_11  = [ 1.492859e+00 ; 1.227828e+00 ; 1.323486e+00 ];

%-- Image #12:
omc_12 = [ -1.990770e+00 ; -2.055042e+00 ; -1.103461e-01 ];
Tc_12  = [ -2.494750e+01 ; -6.137125e+01 ; 3.115348e+02 ];
omc_error_12 = [ 1.035928e-02 ; 1.249993e-02 ; 2.198148e-02 ];
Tc_error_12  = [ 2.286983e+00 ; 1.893510e+00 ; 2.274266e+00 ];

%-- Image #13:
omc_13 = [ -2.139285e+00 ; -2.019671e+00 ; -5.722532e-01 ];
Tc_13  = [ -5.254213e+01 ; -4.549974e+01 ; 1.845966e+02 ];
omc_error_13 = [ 5.623451e-03 ; 6.960784e-03 ; 1.271392e-02 ];
Tc_error_13  = [ 1.380867e+00 ; 1.138923e+00 ; 1.351138e+00 ];

%-- Image #14:
omc_14 = [ -1.641250e+00 ; -1.991210e+00 ; 2.887551e-01 ];
Tc_14  = [ -5.634333e+01 ; -7.708524e+01 ; 2.344704e+02 ];
omc_error_14 = [ 6.096921e-03 ; 6.430246e-03 ; 1.032192e-02 ];
Tc_error_14  = [ 1.746027e+00 ; 1.421522e+00 ; 1.410359e+00 ];

%-- Image #15:
omc_15 = [ -1.566638e+00 ; -1.882602e+00 ; -2.131615e-01 ];
Tc_15  = [ -4.427313e+01 ; -5.677663e+01 ; 1.849387e+02 ];
omc_error_15 = [ 4.601810e-03 ; 6.878513e-03 ; 9.205126e-03 ];
Tc_error_15  = [ 1.362921e+00 ; 1.122846e+00 ; 1.179677e+00 ];

%-- Image #16:
omc_16 = [ 2.053895e+00 ; 2.220549e+00 ; -2.189978e-01 ];
Tc_16  = [ -3.804613e+01 ; -5.824795e+01 ; 1.978760e+02 ];
omc_error_16 = [ 6.041423e-03 ; 6.734125e-03 ; 1.338745e-02 ];
Tc_error_16  = [ 1.454779e+00 ; 1.186108e+00 ; 1.223015e+00 ];

%-- Image #17:
omc_17 = [ NaN ; NaN ; NaN ];
Tc_17  = [ NaN ; NaN ; NaN ];
omc_error_17 = [ NaN ; NaN ; NaN ];
Tc_error_17  = [ NaN ; NaN ; NaN ];

%-- Image #18:
omc_18 = [ NaN ; NaN ; NaN ];
Tc_18  = [ NaN ; NaN ; NaN ];
omc_error_18 = [ NaN ; NaN ; NaN ];
Tc_error_18  = [ NaN ; NaN ; NaN ];

%-- Image #19:
omc_19 = [ -1.871151e+00 ; -2.171023e+00 ; 8.833392e-01 ];
Tc_19  = [ -3.535999e+01 ; -6.384568e+01 ; 2.259566e+02 ];
omc_error_19 = [ 7.244257e-03 ; 4.764241e-03 ; 1.014431e-02 ];
Tc_error_19  = [ 1.663834e+00 ; 1.349229e+00 ; 1.103694e+00 ];

%-- Image #20:
omc_20 = [ 1.966593e+00 ; 1.503931e+00 ; 3.897885e-01 ];
Tc_20  = [ -3.927659e+01 ; -4.896793e+01 ; 1.676245e+02 ];
omc_error_20 = [ 6.320358e-03 ; 5.211995e-03 ; 9.010753e-03 ];
Tc_error_20  = [ 1.247784e+00 ; 1.005534e+00 ; 1.152128e+00 ];

