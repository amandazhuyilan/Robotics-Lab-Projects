%Read in rosbag files
ClosedStationary = rosbag('Closed_area_stationary_2018-02-08-13-11-51.bag');
ClosedWalk = rosbag('Closed_area_walk_2018-02-08-13-19-59.bag');
OpenStationary = rosbag('Open_area_stationary_2018-02-09-14-40-03.bag');
OpenWalk = rosbag('Open_area_walk_2018-02-09-14-55-37.bag');


%Filter Rosbags by topic name
utmClosedStationary = select(ClosedStationary, 'Topic', '/utm_fix');
rtkClosedStationary = select(ClosedStationary, 'Topic', '/rtk_fix');
utmClosedWalk = select(ClosedWalk, 'Topic', '/utm_fix');
rtkClosedWalk = select(ClosedWalk, 'Topic', '/rtk_fix');
utmOpenStationary = select(OpenStationary, 'Topic', '/utm_fix');
rtkOpenStationary = select(OpenStationary, 'Topic', '/rtk_fix');
utmOpenWalk = select(OpenWalk, 'Topic', '/utm_fix');
rtkOpenWalk = select(OpenWalk, 'Topic', '/rtk_fix');

%Return all messages as cell array
msg_utmClosedStationary = readMessages(utmClosedStationary);
msg_utmClosedWalk = readMessages(utmClosedWalk);
msg_utmOpenStationary = readMessages(utmOpenStationary);
msg_utmOpenWalk = readMessages(utmOpenWalk);

%% Convert Cell Arrays

%ClosedStationary
utmx_ClosedStationary = zeros(size(msg_utmClosedStationary));
utmy_ClosedStationary = zeros(size(msg_utmClosedStationary));
utmz_ClosedStationary = zeros(size(msg_utmClosedStationary));

for n=1:1:size(msg_utmClosedStationary)
   temp = msg_utmClosedStationary(n);
   temp2 = temp{1,1};
   utmx_ClosedStationary(n) = temp2.Pose.Pose.Position.X;
   utmy_ClosedStationary(n) = temp2.Pose.Pose.Position.Y;
   utmz_ClosedStationary(n) = temp2.Pose.Pose.Position.Z;
end

%ClosedWalk
utmx_ClosedWalk = zeros(size(msg_utmClosedWalk));
utmy_ClosedWalk = zeros(size(msg_utmClosedWalk));
utmz_ClosedWalk = zeros(size(msg_utmClosedWalk));

for n=1:1:size(msg_utmClosedWalk)
   temp = msg_utmClosedWalk(n);
   temp2 = temp{1,1};
   utmx_ClosedWalk(n) = temp2.Pose.Pose.Position.X;
   utmy_ClosedWalk(n) = temp2.Pose.Pose.Position.Y;
   utmz_ClosedWalk(n) = temp2.Pose.Pose.Position.Z;
end

%OpenStationary
utmx_OpenStationary = zeros(size(msg_utmOpenStationary));
utmy_OpenStationary = zeros(size(msg_utmOpenStationary));
utmz_OpenStationary = zeros(size(msg_utmOpenStationary));

for n=1:1:size(msg_utmOpenStationary)
   temp = msg_utmOpenStationary(n);
   temp2 = temp{1,1};
   utmx_OpenStationary(n) = temp2.Pose.Pose.Position.X;
   utmy_OpenStationary(n) = temp2.Pose.Pose.Position.Y;
   utmz_OpenStationary(n) = temp2.Pose.Pose.Position.Z;
end

%OpenWalk
utmx_OpenWalk = zeros(size(msg_utmOpenWalk));
utmy_OpenWalk = zeros(size(msg_utmOpenWalk));
utmz_OpenWalk = zeros(size(msg_utmOpenWalk));

for n=1:1:size(msg_utmOpenWalk)
   temp = msg_utmOpenWalk(n);
   temp2 = temp{1,1};
   utmx_OpenWalk(n) = temp2.Pose.Pose.Position.X;
   utmy_OpenWalk(n) = temp2.Pose.Pose.Position.Y;
   utmz_OpenWalk(n) = temp2.Pose.Pose.Position.Z;
end

%{
%Create all rosbags as timeseries
ts_utm_ClosedStationary = timeseries(utmClosedStationary, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');
ts_utm_ClosedWalk = timeseries(utmClosedWalk, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');
ts_utm_OpenStationary = timeseries(utmOpenStationary, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');
ts_utm_OpenWalk = timeseries(utmOpenWalk, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');

ts_rtk_OpenWalk = timeseries(rtkOpenWalk, 'Latitude', 'Longitude', 'Altitude');
%}
% 
% %% Normalize utm data
% utmx_ClosedStationary=utmx_ClosedStationary-utmx_ClosedStationary(1);
% utmy_ClosedStationary=utmy_ClosedStationary-utmy_ClosedStationary(1);
% utmz_ClosedStationary=utmz_ClosedStationary-utmz_ClosedStationary(1);
% utmx_ClosedWalk=utmx_ClosedWalk-utmx_ClosedWalk(1);
% utmy_ClosedWalk=utmy_ClosedWalk-utmy_ClosedWalk(1);
% utmz_ClosedWalk=utmz_ClosedWalk-utmz_ClosedWalk(1);
% utmx_OpenStationary=utmx_OpenStationary-utmx_OpenStationary(1);
% utmy_OpenStationary=utmy_OpenStationary-utmy_OpenStationary(1);
% utmz_OpenStationary=utmz_OpenStationary-utmz_OpenStationary(1);
% utmx_OpenWalk=utmx_OpenWalk-utmx_OpenWalk(1);
% utmy_OpenWalk=utmy_OpenWalk-utmy_OpenWalk(1);
% utmz_OpenWalk=utmz_OpenWalk-utmz_OpenWalk(1);

%% Plot each utmx utmy utmz coordinates scales (1,1,1)
xlabel("UTM x");
ylabel("UTM y");
%% ClosedStationary
figure
mean_x = mean(utmx_ClosedStationary);
mean_y = mean(utmy_ClosedStationary);

scatter(utmx_ClosedStationary,utmy_ClosedStationary,5);
hold on 
plot(mean_x,mean_y,'+r','LineWidth',8);
hold off

title("Stationay UTM data in Closed Area");
xlabel("UTM x (m)");
ylabel("UTM y (m)");
axis equal

%% ClosedWalk
figure
plot(utmx_ClosedWalk,utmy_ClosedWalk);
title("Walk UTM data in Closed Area");
xlabel("UTM x (m)");
ylabel("UTM y (m)");
axis equal

%% OpenStationary
figure
hold on
for i=500:length(utmx_OpenStationary)-200
   scatter(utmx_OpenStationary(i:i+1),utmy_OpenStationary(i:i+1),5,[1,i/length(utmx_OpenStationary),0]);
end
hold on
mean_x2 = mean(utmx_OpenStationary);
mean_y2 = mean(utmy_OpenStationary);
plot(mean_x2,mean_y2,'+b','LineWidth',8)

title("Stationary UTM Data in Open Area")
xlabel("UTM x (m)");
ylabel("UTM y (m)");
axis equal

%% OpenWalk
figure
hold on
%plot3(utmx_OpenWalk,utmy_OpenWalk,utmz_OpenWalk);
%plot(utmx_OpenWalk,utmy_OpenWalk);
for i=1:length(utmx_OpenWalk)-1
   plot(utmx_OpenWalk(i:i+1),utmy_OpenWalk(i:i+1),'color',[1,i/length(utmx_OpenWalk),0]);
end
axis equal
xlabel("UTM x (m)");
ylabel("UTM y (m)");
title("Walk UTM Data in Open Area")
