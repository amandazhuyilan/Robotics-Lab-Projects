#!/usr/bin/python
import serial
import lcm
from gps_lcm import gps_t
import utm

def convert_to_dd(degrees):
	if degrees >= 0:
		return degrees/100 + float(degrees % 100)/60
	else:
		return degrees/100 - float(-degrees % 100)/60

lc = lcm.LCM()
msg = gps_t()

ser = serial.Serial(port = "/dev/ttyUSB0",
baudrate = 4800,
timeout = 5
)

while True:
   line_raw = ser.readline()
   line = line_raw.split(',')
   if line[0] == "$GPGGA":
      msg.time = float(line[1])
      msg.lat = float(line[2])
      msg.lon = -float(line[4])
      msg.alt = float(line[9])

      utm_msg = utm.from_latlon(convert_to_dd(msg.lat), convert_to_dd(msg.lon))
      msg.utm_x = utm_msg[0]
      msg.utm_y = utm_msg[1]
      print "lon =", msg.lon, "lat =", msg.lat
      print "utm_x =", msg.utm_x, "utm_y = ", msg.utm_y
      lc.publish("GPS", msg.encode())      
ser.close()                                                                                                    
