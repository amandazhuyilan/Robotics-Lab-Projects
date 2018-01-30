clear all
clear java
% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath '/home/amanda/EECE-5698/lab1/GPS_struct_type.jar'
javaaddpath '/usr/local/share/java/lcm.jar'

% Let’s assume the logging file is lcm-l.02 in the dir below
% open log file for reading

static_log_file = lcm.logging.Log('./log/lcm-log-static', 'r'); 
dynamic_log_file = lcm.logging.Log('./log/lcm-log-dynamic', 'r');

% now read the file
% name will % here we are assuming that the channel we are interested in is RDI. Your channel 
% be different - something to do with GPS
% also RDI has fields altitude and ranges - GPS will probably have lat, lon, utmx,
% utmy etc
res_static = [];
while true
    try
        ev = static_log_file.readNext();
        % channel name is in ev.channel
        % there may be multiple channels but in this case you are only interested in RDI channel
        if strcmp(ev.channel, 'GPS')
 
        % build rdi object from data in this record
            msg_gps = gps_lcm.gps_t(ev.data);

        % now you can do things like d epending upon the rdi_t struct that was defined
            utm_x = msg_gps.utm_x;
            utm_y = msg_gps.utm_y;
            
            res_static = [res_static; utm_x utm_y];
        end
    catch err   % exception will be thrown when you hit end of file
        break;
    end
end

res_dynamic = [];
while true
    try
        ev = dynamic_log_file.readNext();
        % channel name is in ev.channel
        % there may be multiple channels but in this case you are only interested in RDI channel
        if strcmp(ev.channel, 'GPS')
 
        % build rdi object from data in this record
            msg_gps = gps_lcm.gps_t(ev.data);

        % now you can do things like depending upon the rdi_t struct that was defined
            utm_x = msg_gps.utm_x;
            utm_y = msg_gps.utm_y;
            
            res_dynamic = [res_dynamic; utm_x utm_y];
        end
    catch err   % exception will be thrown when you hit end of file
        break;
    end
end


figure 
plot(res_static(:,1), res_static(:,2), '*');
title("UTM Static Data for 10 min")
xlabel("UTM-x (meters East)")
ylabel("UTM-y (meters North)")
xtickformat('%.5f')
ytickformat('%.5f')
set(gca,'XTick',[min(res_static(:,1)), mean(res_static(:,1)), max(res_static(:,1))])
set(gca,'YTick',[min(res_static(:,2)), mean(res_static(:,2)), max(res_static(:,2))])


figure 
plot(res_dynamic(:,1), res_dynamic(:,2), '.');
title("UTM Dynamic Data for 1 min")
xlabel("UTM-x (meters East)")
ylabel("UTM-y (meters North)")
xtickformat('%.5f')
ytickformat('%.5f')
set(gca,'XTick',[min(res_dynamic(:,1)), mean(res_dynamic(:,1)), max(res_dynamic(:,1))])
set(gca,'YTick',[min(res_dynamic(:,2)), mean(res_dynamic(:,2)), max(res_dynamic(:,2))])


