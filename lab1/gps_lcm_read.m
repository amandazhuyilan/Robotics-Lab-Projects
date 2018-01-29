clear all
clear java
% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath '/home/amanda/EECE-5698/lab1/GPS_struct_type.jar'
javaaddpath '/usr/local/share/java/lcm.jar'

% Let’s assume the logging file is lcm-l.02 in the dir below
% open log file for reading

log_file = lcm.logging.Log('/home/amanda/EECE-5698/lab1/log/lcm-log-10min', 'r'); 

% now read the file 
% name will % here we are assuming that the channel we are interested in is RDI. Your channel 
% be different - something to do with GPS
% also RDI has fields altitude and ranges - GPS will probably have lat, lon, utmx,
% utmy etc
res = [];
while true
    try
        ev = log_file.readNext();
        % channel name is in ev.channel
        % there may be multiple channels but in this case you are only interested in RDI channel
        if strcmp(ev.channel, 'GPS')
 
        % build rdi object from data in this record
            msg_gps = gps_lcm.gps_t(ev.data);

        % now you can do things like depending upon the rdi_t struct that was defined
            utm_x = msg_gps.utm_x;
            utm_y = msg_gps.utm_y;
            
            res = [res; utm_x utm_y];
        end
    catch err   % exception will be thrown when you hit end of file
        break;
    end
end

figure 
plot(res(:,1), res(:,2), '*');
% add legend, add title



