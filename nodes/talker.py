#!/usr/bin/env python

#THIS MODULE IS JUST FOR TESTING OF THE LISTENER NODE

import roslib; roslib.load_manifest('ChapticBelt')
import rospy
from ChapticBelt.msg import data

def talker():
    pub = rospy.Publisher('BeltStream', data)
    msg=data()
    rospy.init_node('talker')
    while not rospy.is_shutdown():
        msg.angle=22
	msg.distance=18.4352435
        rospy.loginfo(msg)
        pub.publish(msg)
        rospy.sleep(10)
if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException: pass
