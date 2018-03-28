#!/usr/bin/env python
import socket  # Import socket module
import rospy
import re
from sensor_msgs.msg import NavSatFix, NavSatStatus


def read_rtk_gps():
    s = socket.socket()  # Create a socket object
    # these are parameters loaded onto the ros parameter servers
    host = rospy.get_param('~host', '172.20.10.5')
    # these are parameters loaded onto the ros parameter servers
    port = rospy.get_param('~port', 3000)
    s.connect((host, port))

    rospy.init_node('rtk_gps_node')
    pub_navsatfix = rospy.Publisher("/rtk_fix", NavSatFix, queue_size=0)

    navsatfix = NavSatFix()

    while True:
        GPS_msgs = s.recv(1024)
        msgs = re.split('\r\n', GPS_msgs)
        for msg in msgs:
            if msg[:6] == "$GPGGA":
                print msg
                data = msg.split(',')
                navsatfix.status = NavSatStatus(status=int(data[6]))
                navsatfix.latitude = float(data[2][:2])
                navsatfix.longitude = float(data[4][:3])
                navsatfix.altitude = float(data[9])

                navsatfix.header.stamp = rospy.Time.now()

                pub_navsatfix.publish(navsatfix)


if __name__ == '__main__':
    try:
        print("rtk_gps_node running!\n")
        read_rtk_gps()
    except rospy.ROSInterruptException:
        pass
