%% Histogram of stationary_closed_utm_x 
figure
hold on 
histfit(utmx_ClosedStationary)
title('Histogram of Stationary UTM x Data in Closed Area')
xlabel("UTM x (m)");
ylabel("Deviation")

%% Histogram of stationary_closed_utm_y 
figure
hold on 
histfit(utmy_ClosedStationary)
title('Histogram of Stationary UTM y Data in Closed Area');
xlabel("UTM y (m)");
ylabel("Deviation");


%% Histogram of stationary_closed_utm_z 
figure
hold on 
histfit(utmy_ClosedStationary);
title('Histogram of Stationary UTM z Data in Closed Area');
xlabel("UTM z (m)");
ylabel("Deviation");

%% Histogram of stationary_open_utm_x 
figure
hold on 
h = histfit(utmx_OpenStationary);
title('Histogram of Stationary UTM x Data in Open Area')
xlabel("UTM x (m)");
ylabel("Deviation")

h(1).FaceColor = [.8 .8 1];

%% Histogram of stationary_open_utm_y 
figure
hold on 
h = histfit(utmy_OpenStationary);
title('Histogram of Stationary UTM y Data in Open Area')
xlabel("UTM y (m)");
ylabel("Deviation")

h(1).FaceColor = [.8 .8 1];

%% Histogram of stationary_open_utm_z 
figure
hold on 
h = histfit(utmz_OpenStationary);
title('Histogram of Stationary UTM z Data in Open Area')
xlabel("UTM z (m)");
ylabel("Deviation")

h(1).FaceColor = [.8 .8 1];
