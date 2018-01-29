% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath '/home/amanda/EECE-5698/lab1/GPS_struct_type.jar'


% Let’s assume the logging file is lcm-l.02 in the dir below
% open log file for reading

log_file = lcm.logging.Log('/home/amanda/EECE-5698/lab1/data/lcm-log-2018-01-27-16:35:47', 'r'); 

% now read the file 
% here we are assuming that the channel we are interested in is RDI. Your channel 
% name will be different - something to do with GPS
% also RDI has fields altitude and ranges - GPS will probably have lat, lon, utmx,
% utmy etc

while true
 try
   ev = log_file.readNext();
   
   % channel name is in ev.channel
   % there may be multiple channels but in this case you are only interested in RDI channel
   if strcmp(ev.channel, 'GPS')
 
     % build rdi object from data in this record
      msg_gps = gps_lcm.gps_t(ev.data);

      % now you can do things like depending upon the rdi_t struct that was defined
      lon = msg_gps.lon;
      alt = msg_gps.alt;
      rng = msg_gps.ranges;
      timestamp = msg_gps.utime;  % (timestamp in microseconds since the epoch)
    end
  catch err   % exception will be thrown when you hit end of file
     break;
  end
end
