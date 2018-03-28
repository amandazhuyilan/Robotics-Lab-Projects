% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 516.343355378827596 ; 570.081446557867253 ];

%-- Principal point:
cc = [ 318.998382740096361 ; 243.700537816371849 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.161151584512667 ; -0.488898189220412 ; -0.002740893595550 ; 0.001341917061656 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.899585365133085 ; 3.245584833992580 ];

%-- Principal point uncertainty:
cc_error = [ 3.851443510187719 ; 3.546013320386604 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.022737355603099 ; 0.094679047478182 ; 0.002619434438459 ; 0.003360198962768 ; 0.000000000000000 ];

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
omc_1 = [ 1.999908e+00 ; 1.894837e+00 ; -1.929984e-01 ];
Tc_1  = [ -6.289365e+01 ; -5.239811e+01 ; 2.159914e+02 ];
omc_error_1 = [ 5.775873e-03 ; 6.890715e-03 ; 1.143206e-02 ];
Tc_error_1  = [ 1.627025e+00 ; 1.347180e+00 ; 1.381243e+00 ];

%-- Image #2:
omc_2 = [ 2.154388e+00 ; 2.082334e+00 ; -1.015904e-01 ];
Tc_2  = [ -6.028051e+01 ; -5.779617e+01 ; 2.264184e+02 ];
omc_error_2 = [ 7.374828e-03 ; 8.065328e-03 ; 1.550371e-02 ];
Tc_error_2  = [ 1.709228e+00 ; 1.413084e+00 ; 1.524427e+00 ];

%-- Image #3:
omc_3 = [ 1.858530e+00 ; 2.261200e+00 ; -3.184626e-01 ];
Tc_3  = [ -4.249187e+01 ; -6.508779e+01 ; 2.485897e+02 ];
omc_error_3 = [ 6.010209e-03 ; 8.345699e-03 ; 1.404193e-02 ];
Tc_error_3  = [ 1.862546e+00 ; 1.537526e+00 ; 1.502593e+00 ];

%-- Image #4:
omc_4 = [ 2.109351e+00 ; 2.132317e+00 ; -3.530041e-01 ];
Tc_4  = [ -6.445422e+01 ; -6.266713e+01 ; 2.106513e+02 ];
omc_error_4 = [ 5.524916e-03 ; 7.400202e-03 ; 1.321378e-02 ];
Tc_error_4  = [ 1.596295e+00 ; 1.318511e+00 ; 1.359623e+00 ];

%-- Image #5:
omc_5 = [ 1.842227e+00 ; 2.015156e+00 ; -8.635498e-02 ];
Tc_5  = [ -5.098187e+01 ; -5.781925e+01 ; 2.292968e+02 ];
omc_error_5 = [ 5.867214e-03 ; 7.302417e-03 ; 1.169577e-02 ];
Tc_error_5  = [ 1.726146e+00 ; 1.425624e+00 ; 1.459350e+00 ];

%-- Image #6:
omc_6 = [ -2.036858e+00 ; -2.335029e+00 ; 2.428645e-01 ];
Tc_6  = [ -4.833206e+01 ; -5.997715e+01 ; 2.317880e+02 ];
omc_error_6 = [ 7.721266e-03 ; 8.300048e-03 ; 1.635990e-02 ];
Tc_error_6  = [ 1.737296e+00 ; 1.440636e+00 ; 1.492984e+00 ];

%-- Image #7:
omc_7 = [ -1.859850e+00 ; -1.945148e+00 ; -6.765270e-01 ];
Tc_7  = [ -3.415395e+01 ; -4.757195e+01 ; 1.725421e+02 ];
omc_error_7 = [ 4.560896e-03 ; 7.404680e-03 ; 1.089177e-02 ];
Tc_error_7  = [ 1.316198e+00 ; 1.089653e+00 ; 1.272552e+00 ];

%-- Image #8:
omc_8 = [ -2.195078e+00 ; -1.967503e+00 ; -7.553497e-01 ];
Tc_8  = [ -3.066388e+01 ; -3.868830e+01 ; 1.643048e+02 ];
omc_error_8 = [ 4.706094e-03 ; 7.298163e-03 ; 1.217413e-02 ];
Tc_error_8  = [ 1.253905e+00 ; 1.025456e+00 ; 1.241132e+00 ];

%-- Image #9:
omc_9 = [ 2.101665e+00 ; -1.722903e+00 ; -1.004899e+00 ];
Tc_9  = [ 7.212388e+01 ; 4.351274e+01 ; 2.261074e+02 ];
omc_error_9 = [ 7.812558e-03 ; 5.579125e-03 ; 1.174508e-02 ];
Tc_error_9  = [ 1.722669e+00 ; 1.441037e+00 ; 1.549868e+00 ];

%-- Image #10:
omc_10 = [ 1.995909e+00 ; -1.839307e+00 ; -1.050410e+00 ];
Tc_10  = [ 5.479253e+01 ; 4.284584e+01 ; 1.970008e+02 ];
omc_error_10 = [ 7.644528e-03 ; 5.330165e-03 ; 1.081340e-02 ];
Tc_error_10  = [ 1.482896e+00 ; 1.242024e+00 ; 1.313041e+00 ];

%-- Image #11:
omc_11 = [ -2.156499e+00 ; 2.144543e+00 ; 4.498775e-01 ];
Tc_11  = [ 8.386924e+01 ; 4.637925e+01 ; 2.091592e+02 ];
omc_error_11 = [ 7.054563e-03 ; 6.982326e-03 ; 1.509102e-02 ];
Tc_error_11  = [ 1.580779e+00 ; 1.343012e+00 ; 1.448250e+00 ];

%-- Image #12:
omc_12 = [ -2.198096e+00 ; 2.124978e+00 ; 4.029283e-01 ];
Tc_12  = [ 9.267078e+01 ; 4.111863e+01 ; 3.193991e+02 ];
omc_error_12 = [ 1.291387e-02 ; 1.130857e-02 ; 2.611640e-02 ];
Tc_error_12  = [ 2.398464e+00 ; 2.021221e+00 ; 2.236381e+00 ];

%-- Image #13:
omc_13 = [ -1.887593e+00 ; 1.998787e+00 ; 2.029156e-01 ];
Tc_13  = [ 6.856728e+01 ; 3.659895e+01 ; 2.406440e+02 ];
omc_error_13 = [ 5.879756e-03 ; 6.958479e-03 ; 1.216354e-02 ];
Tc_error_13  = [ 1.788841e+00 ; 1.508266e+00 ; 1.351326e+00 ];

%-- Image #14:
omc_14 = [ 2.175815e+00 ; -1.792807e+00 ; -7.914687e-01 ];
Tc_14  = [ 3.374984e+01 ; 4.675536e+01 ; 2.029580e+02 ];
omc_error_14 = [ 7.725126e-03 ; 5.389322e-03 ; 1.175434e-02 ];
Tc_error_14  = [ 1.513522e+00 ; 1.266165e+00 ; 1.341146e+00 ];

%-- Image #15:
omc_15 = [ -2.157457e+00 ; 1.793890e+00 ; 9.974275e-01 ];
Tc_15  = [ 6.134560e+01 ; 5.623123e+01 ; 2.092171e+02 ];
omc_error_15 = [ 5.267645e-03 ; 6.553850e-03 ; 1.156905e-02 ];
Tc_error_15  = [ 1.569726e+00 ; 1.323928e+00 ; 1.271446e+00 ];

%-- Image #16:
omc_16 = [ 2.198180e+00 ; -2.033978e+00 ; 1.634448e-01 ];
Tc_16  = [ 7.431173e+01 ; 4.856686e+01 ; 1.769950e+02 ];
omc_error_16 = [ 6.081586e-03 ; 7.099825e-03 ; 1.357809e-02 ];
Tc_error_16  = [ 1.345644e+00 ; 1.147911e+00 ; 1.332294e+00 ];

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
omc_19 = [ 1.924162e+00 ; -1.658318e+00 ; -1.894648e-01 ];
Tc_19  = [ 4.654748e+01 ; 3.631706e+01 ; 1.381606e+02 ];
omc_error_19 = [ 5.531681e-03 ; 5.940680e-03 ; 9.739772e-03 ];
Tc_error_19  = [ 1.062625e+00 ; 8.979488e-01 ; 1.096194e+00 ];

%-- Image #20:
omc_20 = [ -1.637391e+00 ; 2.143376e+00 ; -8.976246e-01 ];
Tc_20  = [ 8.262890e+01 ; 2.605919e+01 ; 2.314649e+02 ];
omc_error_20 = [ 7.059493e-03 ; 5.550857e-03 ; 9.892017e-03 ];
Tc_error_20  = [ 1.724521e+00 ; 1.459874e+00 ; 1.262530e+00 ];

