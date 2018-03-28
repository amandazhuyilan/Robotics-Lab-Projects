#!/usr/bin/python
import serial
import lcm
from imu_lcm import imu_t

lc = lcm.LCM()
imu_data = imu_t()

ser = serial.Serial(port="/dev/ttyUSB0",
                    baudrate=115200,
                    timeout=5
                    )

while True:
    msgs = ser.readline()
    msg = msgs.split(',')

    for i in msgs:
        if "\\x00" in i:
            continue

    if msg[0] == "$VNYMR":
        print msg
        imu_data.yaw = float(msg[1])
        imu_data.pitch = float(msg[2])
        imu_data.roll = float(msg[3])
        imu_data.mag_x = float(msg[4])
        imu_data.mag_y = float(msg[5])
        imu_data.mag_z = float(msg[6])
        imu_data.accel_x = float(msg[7])
        imu_data.accel_y = float(msg[8])
        imu_data.accel_z = float(msg[9])
        imu_data.gyro_x = float(msg[10])
        imu_data.gyro_y = float(msg[11])
        imu_data.gyro_z = float(msg[12][:-5])   # remove the last few characters for checksums

        lc.publish("IMU", imu_data.encode())
        print "Published: ", msg
ser.close()
