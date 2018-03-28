#!/usr/bin/env python
import rospy
import utm
from sensor_msgs.msg import NavSatFix
from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry


def convert_to_dd(degrees):
    if degrees >= 0:
        return degrees / 100 + float(degrees % 100) / 60
    else:
        return degrees / 100 - float(-degrees % 100) / 60


def callback(data):
    utm_msg = utm.from_latlon(convert_to_dd(
        data.latitude), convert_to_dd(data.longitude))

    odom = Odometry()
    odom.pose.pose.position = Point(utm_msg[0], utm_msg[1], data.altitude)

    pub_gps_utm = rospy.Publisher('utm_fix', Odometry, queue_size=0)
    pub_gps_utm.publish(odom)

    print("utm_x = ", odom.pose.pose.position.x, " utm_y = ",
          odom.pose.pose.position.y, " utm_z = ", odom.pose.pose.position.z)


def rtk_listener():
    rospy.init_node("gps2utm_node", anonymous=True)
    print("gps2utm_node created")

    rospy.Subscriber("/rtk_fix", NavSatFix, callback)
    rospy.spin()


if __name__ == '__main__':
    try:
        print 'gps2utm_node running!\n'
        rtk_listener()
    except rospy.ROSInterruptException:
        pass
