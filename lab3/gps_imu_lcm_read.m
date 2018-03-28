clear all
clear java
% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath './lcmtypes/GPS_struct_type.jar'
javaaddpath './lcmtypes/IMU_struct_type.jar'
javaaddpath '/usr/local/share/java/lcm.jar'

% Let’s assume the logging file is lcm-l.02 in the dir below
% open log file for reading

log_file_run1 = lcm.logging.Log('./log/lcm-log-run1', 'r'); 

% now read the file
% name will % here we are assuming that the channel we are interested in is RDI. Your channel 
% be different - something to do with GPS
% also RDI has fields altitude and ranges - GPS will probably have lat, lon, utmx,
% utmy etc
GPS_data_run = [];
IMU_data_run = [];

while true
    try
        ev = log_file_run1.readNext();
        % channel name is in ev.channel
        if strcmp(ev.channel, 'GPS')
 
        % build rdi object from data in this record
            msg_gps = gps_lcm.gps_t(ev.data);

        % now you can do things like d epending upon the rdi_t struct that was defined
            gps_time = ev.utime/1e+6;
        
            utm_x = msg_gps.utm_x;
            utm_y = msg_gps.utm_y;
            
            GPS_data_run = [GPS_data_run; gps_time utm_x utm_y];
        end
        
        if strcmp(ev.channel, 'IMU')
 
        % build rdi object from data in this record
            msg_imu = imu_lcm.imu_t(ev.data);

        % now you can do things like depending upon the rdi_t struct that was defined
            imu_time = ev.utime/1e+6;
            
            yaw = msg_imu.yaw;
            pitch = msg_imu.pitch;
            roll = msg_imu.roll;
            
            mag_x = msg_imu.mag_x;
            mag_y = msg_imu.mag_y;
            mag_z = msg_imu.mag_z;
            
            accel_x = msg_imu.accel_x;
            accel_y = msg_imu.accel_y;
            accel_z = msg_imu.accel_z;
            
            gyro_x = msg_imu.gyro_x;
            gyro_y = msg_imu.gyro_y;
            gyro_z = msg_imu.gyro_z;

            IMU_data_run = [IMU_data_run;imu_time yaw pitch roll mag_x mag_y mag_z accel_x accel_y accel_z gyro_x gyro_y gyro_z];
        end
        
    catch err   % exception will be thrown when you hit end of file
        break;
    end
end

log_file_stationary = lcm.logging.Log('./log/lcm-log-stationary', 'r'); 

% now read the file
% name will % here we are assuming that the channel we are interested in is RDI. Your channel 
% be different - something to do with GPS
% also RDI has fields altitude and ranges - GPS will probably have lat, lon, utmx,
% utmy etc
GPS_data_stationary = [];
IMU_data_stationary = [];

while true
    try
        ev = log_file_stationary.readNext();
        % channel name is in ev.channel
        % there may be multiple channels but in this case you are only interested in RDI channel
        if strcmp(ev.channel, 'GPS')
 
        % build rdi object from data in this record
            msg_gps_stationary = gps_lcm.gps_t(ev.data);

        % now you can do things like d epending upon the rdi_t struct that was defined
            gps_time = ev.utime/1e+6;
%             datetime(gps_time/1e+6, 'ConvertFrom', 'posixtime') % convert the timestamp to human readable format
            utm_x = msg_gps_stationary.utm_x;
            utm_y = msg_gps_stationary.utm_y;
            
            GPS_data_stationary = [GPS_data_run; gps_time utm_x utm_y];
        end
        
        if strcmp(ev.channel, 'IMU')
 
        % build rdi object from data in this record
            msg_imu_stationary = imu_lcm.imu_t(ev.data);

        % now you can do things like depending upon the rdi_t struct that was defined
            imu_time = ev.utime/1e+6;
            
            yaw = msg_imu_stationary.yaw;
            pitch = msg_imu_stationary.pitch;
            roll = msg_imu_stationary.roll;
            
            mag_x = msg_imu_stationary.mag_x;
            mag_y = msg_imu_stationary.mag_y;
            mag_z = msg_imu_stationary.mag_z;
            
            accel_x = msg_imu_stationary.accel_x;
            accel_y = msg_imu_stationary.accel_y;
            accel_z = msg_imu_stationary.accel_z;
            
            gyro_x = msg_imu_stationary.gyro_x;
            gyro_y = msg_imu_stationary.gyro_y;
            gyro_z = msg_imu_stationary.gyro_z;

            IMU_data_stationary = [IMU_data_stationary;imu_time yaw pitch roll mag_x mag_y mag_z accel_x accel_y accel_z gyro_x gyro_y gyro_z];
        end
        
    catch err   % exception will be thrown when you hit end of file
        break;
    end
end

%% Compile the time series
IMU_data_stationary(:,1) = IMU_data_stationary(:,1) - IMU_data_stationary(1,1);
IMU_data_run(:,1) = IMU_data_run(:,1) - IMU_data_run(1,1);

GPS_data_run(:,1) = GPS_data_run(:,1) - GPS_data_run(1,1);
GPS_data_stationary(:,1) = GPS_data_stationary(:,1) - GPS_data_stationary(1,1);

%% Step 0: Plot stationary data
% Plot stationary IMU yaw data
figure 
subplot(1,2,1);
plot(IMU_data_stationary(:,1), IMU_data_stationary(:,2), '.');
title("IMU Stationary Yaw data");
xlabel("Time / sec");
ylabel("Yaw / Degrees");
subplot(1,2,2);
histfit(IMU_data_stationary(:,2));
title("IMU Yaw Histogram with a Distribution Fit");
stationary_yaw_mean = mean(IMU_data_stationary(:,2));

% Plot stationary IMU Pitch data 
figure 
subplot(1,2,1)
plot(IMU_data_stationary(:,1), IMU_data_stationary(:,3), '.');
title("IMU Stationary Pitch data");
xlabel("Time / Sec");
ylabel("Pitch / Degrees");
subplot(1,2,2);
histfit(IMU_data_stationary(:,3));
title("IMU Pitch Histogram with a Distribution Fit");

stationary_pitch_mean = mean(IMU_data_stationary(:,3));


% Plot stationary IMU Roll data
figure 
subplot(1,2,1)
plot(IMU_data_stationary(:,1), IMU_data_stationary(:,4), '.');
title("IMU Stationary Roll data");
xlabel("Time / Sec");
ylabel("Roll / Degrees");
subplot(1,2,2);
histfit(IMU_data_stationary(:,4));
title("IMU Roll Histogram with a Distribution Fit");

stationary_roll_mean = mean(IMU_data_stationary(:,4));

% Plot stationary IMU mag data
figure 
plot(IMU_data_stationary(:,5), IMU_data_stationary(:,6), '.');
title("IMU Stationary Mag data");
xlabel("Mag - x / Gauss");
ylabel("Mag - y / Gauss");


% Plot IMU gyro data
figure 
plot(IMU_data_stationary(:,1),IMU_data_stationary(:,11));
hold on 
plot(IMU_data_stationary(:,1),(IMU_data_stationary(:,12)));
hold on
plot(IMU_data_stationary(:,1),(IMU_data_stationary(:,13)));
title("IMU Gyro -xyz (rad/s)");
legend('x','y','z');


%% Step 1: Calibrate gyroscope data: Removing the offset by recorded stationary data
% Plot before iron-distortion removal
figure
subplot(2,1,1);
plot(IMU_data_run(:,11))
hold on
plot(IMU_data_run(:,12));
hold on
plot(IMU_data_run(:,13));
title("Raw IMU gyro -xyz data (rad/s)")
xlim([0 21000]);
legend('x','y','z');

IMU_data_run(:,11) = IMU_data_run(:,11) - mean(IMU_data_stationary(:,11));
IMU_data_run(:,12) = IMU_data_run(:,12) - mean(IMU_data_stationary(:,12));
IMU_data_run(:,13) = IMU_data_run(:,13) - mean(IMU_data_stationary(:,13));

% Plot after callibration
subplot(2,1,2);
plot(IMU_data_run(:,11))
hold on
plot(IMU_data_run(:,12));
hold on
plot(IMU_data_run(:,13));
title("Calibrated IMU gyro -xyz data (rad/s)");
xlim([0 21000]);
legend('x','y','z')


%% Step 2-0: Plot GPS during 360 degrees calibration
% From adjusting the start/ending time to find the time range where the
% start and ending point of the GPS route overlapps
plot(GPS_data_run(29:125,2),GPS_data_run(29:125,3));
title("Calibration GPS data")
xlabel("UTM -x"), ylabel("UTM - y")
% We need this range during calibration to calculate the rotation matrix R to apply to the other mag data  
% multiple the time range we found for gps by 40 - sampling rate for IMU is
% 40 Hz
range = [1160 5000];

%% Step 2: Calibrate magnetometer data: Removing the offset by recorded stationary data
% Plot before iron-distortion removal
figure
subplot(2,2,1);
plot(IMU_data_run(:,5), IMU_data_run(:,6));
title("Raw (complete) IMU Mag -xy data (Gauss)")
xlabel("Mag_x"); ylabel("Mag_y");
axis tight equal

% Hard iron distortion removal
mag_x_offset = mean(IMU_data_run(range(1):range(2),5));
mag_y_offset = mean(IMU_data_run(range(1):range(2),6));

IMU_data_run(:,5) = IMU_data_run(:,5) - mag_x_offset;
IMU_data_run(:,6) = IMU_data_run(:,6) - mag_y_offset;

subplot(2,2,4);
plot(IMU_data_run(range(1):range(2),5), IMU_data_run(range(1):range(2),6));
title("Hard Iron Distortion Removal (Callibration) IMU Mag -xy")
xlabel("Mag_x"),ylabel("Mag_y")
axis tight equal

% Soft iron distortion removal
% using a funtion that returns the best fit for an ellipse and get the rotation angle  
ellipse = fit_ellipse(IMU_data_run(range(1):range(2),5),IMU_data_run(range(1):range(2),6));
phi = ellipse.phi;
R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ];
mag_callibrated = horzcat(IMU_data_run(:,5),IMU_data_run(:,6)) * R;
IMU_data_run(:,5) = mag_callibrated(:,1);
IMU_data_run(:,6) = mag_callibrated(:,2);

% Plot after soft iron-distortion removal
subplot(2,2,3);
plot(IMU_data_run(range(1):range(2),5), IMU_data_run(range(1):range(2),6));
title("Soft Iron Distortion Removal (Callibration) IMU Mag -xy")
xlabel("Mag_x")
ylabel("Mag_y")
axis tight equal

% Plot after hard iron-distortion removal

subplot(2,2,2);
plot(IMU_data_run(:,5), IMU_data_run(:,6));
title("Hard Iron Distortion Removal IMU Mag -xy (Gauss)")
xlabel("Mag_x")
ylabel("Mag_y")
axis tight equal;

%%  Step 3 Yaw Estimation
% Removing heading for gyro - z
IMU_data_run(:,2) = IMU_data_run(:,2) - IMU_data_run(1,2);
figure
plot(unwrap(IMU_data_run(:,2)), 'LineWidth',2);
axis tight
hold on

% Step 3-1: Etimate yaw with arctan(mag_y, mag_x)
gyro_est_yaw = (atan2(-IMU_data_run(:,6),IMU_data_run(:,5)))*180/pi;
plot(unwrap(gyro_est_yaw), 'LineWidth',2);

hold on

% Step 3-2: Estimate gyro -z with intergration
mag_est_yaw = cumtrapz(IMU_data_run(:,1),rad2deg(IMU_data_run(:,13)));
plot(unwrap(mag_est_yaw), 'LineWidth',2);
hold on

% Step 3-3: Use a complementary filter to calculate yaw
% Low pass Butterworth filter for mag_est_yaw 
[b,a] = butter(1, 1/50,'low');
filt_mag_est_yaw = filtfilt(b,a,mag_est_yaw);

% High pass filter for gyro - z
[d,c] = butter(1,1/100,'high');
filt_gyro_z = filtfilt(d,c,IMU_data_run(:,13));


alpha= 0.033;
% First reading is the angle as obtained from gyroscope integration
% Second reading is the one from accelerometer.
yaw_compliment(1) = gyro_est_yaw(1);

yaw_compliment(2) = mag_est_yaw(1);


for k=2:length(IMU_data_run)
    yaw_compliment(k) = (1- alpha) * ((yaw_compliment(k-1) + filt_gyro_z(k) *1/40)) + alpha * filt_mag_est_yaw(k);    
end
plot(unwrap(yaw_compliment), 'LineWidth',2)
title("Comparions between Actual and Different Ways to Estimate Yaw")
xlabel("Time / Secs"), ylabel("Yaw / Degrees")
legend("IMU Measured Yaw","Estimated Yaw by arctan(mag_y,mag_x)", "Estimated Yaw with Integrated gyro -z", "Estimated Yaw with Complimentary Filter");

%% Step 4. Vehicle Montion Analysis
% use data after 360 degree calibration 
% remove bias from stationary data
est_velo_x = cumtrapz(IMU_data_run(:,1),IMU_data_run(:,9)-mean(IMU_data_stationary(:,9)));
for i=1:length(est_velo_x)
    est_acc_y(i) = est_velo_x(i) * IMU_data_run(i,13);
end

xc = 1;
diff_gyro_z = diff(IMU_data_run(:,13))/(1/40);

for i=1:length(diff_gyro_z)
    est_acc_y_xc(i) = est_velo_x(i) * deg2rad(IMU_data_run(i,13)) + diff_gyro_z(i) * xc;
end

figure
plot(IMU_data_run(:,8) - mean(IMU_data_stationary(:,8)))
hold on 
plot(est_acc_y)
hold on 
plot(est_acc_y_xc)
legend("Measured acc_y", "Estimated acc_y, xc = 0","Estimated acc_y, xc = 1");
xlabel("Time / sec"), ylabel("acceleration / m^{2}");

%% Step 5. Estimating Trajectory 
figure
plot(est_velo_x); 
hold on
% Calculating and applying the slope of the velo_x data for correction
coefs = polyfit(IMU_data_run(:,1), est_velo_x(:,1),1);
th = atan(coefs(1));

R_corr = [cos(-th) -sin(-th) ;sin(-th) cos(-th)] ;
temp =  transpose(horzcat(IMU_data_run(:,1), est_velo_x(:)));

est_velo_corr = transpose(R_corr * temp);
% removing offset and set the initial speed to zero
plot(est_velo_corr(:,2));
xlim([0 21000])
title("EStimated and corrected x velocity")
legend("Original x velocity by integrating acc_x", "Removed slope and offset from integrated acc_x")

est_traj = cumtrapz(IMU_data_run(:,1), est_velo_corr(:,2));
for i=2:length(est_traj)
    est_traj_x(i) = (est_traj(i) - est_traj(i-1)) * sin(deg2rad(yaw_compliment(i)));
    est_traj_y(i) = (est_traj(i) - est_traj(i-1)) * cos(deg2rad(yaw_compliment(i)));
end 

est_traj_x = cumsum(est_traj_x);
est_traj_y = cumsum(est_traj_y);

phi_traj = deg2rad(-20);
R_traj = [ cos(phi_traj) sin(phi_traj); -sin(phi_traj) cos(phi_traj) ];

temp2 = [est_traj_x; est_traj_y];
est_traj_result = transpose(R_traj * temp2);

figure
plot(est_traj_result(:,1) + 94, est_traj_result(:,2) - 285, 'LineWidth',2);
hold on

% Plot GPS UTM-x UTM-y 
plot((GPS_data_run(:,2) - GPS_data_run(1,2))*2, (GPS_data_run(:,3) - GPS_data_run(1,3)) * 2, 'LineWidth',2);
title("Measured GPS and Integrated Trajectory Comparison")
xlabel("x (meters East)")
ylabel("y (meters North)")
legend("Integrated Trajectory", "GPS")
