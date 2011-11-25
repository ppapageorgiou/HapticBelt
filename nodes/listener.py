#!/usr/bin/env python
import roslib; roslib.load_manifest('ChapticBelt')
import rospy
import bluetooth
from bluetooth import *
from ChapticBelt.msg import data

belt_addr="00:06:66:42:21:78"
sock=bluetooth.BluetoothSocket( bluetooth.RFCOMM )

def callback(data):
    angle=data.angle
    dista=data.distance

    valid=ValidObstacle(dista, angle)

    if (valid==2):

	vib=ChooseVibrator(angle)
	inten=round(CalcIntensity(dista), 7)
	
	btdata = str(vib) + ";" + str(inten)	

	#btdata = [{"vib": vib, "inten": inten}]
	rospy.loginfo(btdata)
	
	SendBtData(btdata)
	

	return 1
    
    else:
	
	return 0


def SendBtData(data):
  
    try:
	sock.send(data)
    except BluetoothError, e:
	rospy.loginfo("Bluetooth Error: %s" % e)

def ConnectBelt(addr):

    port = 1
           
    try:
        status=sock.connect((addr, port))
	sock.send("CONNECTED with STATUS: %s" % status)
	rospy.loginfo(status)
    except BluetoothError, e:
	rospy.loginfo("Bluetooth Error: %s" % e)

    return 1
    

def CalcIntensity(dista):

    value=dista*0.2

    return value

def ValidObstacle(dist, angle):
    
    valid=0

    if (dist<20.0):
        valid+=1
        
    if (angle<90 or angle>270):
        valid+=1
        
    return valid

def ChooseVibrator(angle):
    
    if (angle>=0 and angle<30):
        option=1
        
    elif (angle>=30 and angle<60):
        option=2
        
    elif (angle>=60 and angle<=90):
        option=3
        
    elif (angle>=270 and angle<300):
        option=4
        
    elif (angle>=300 and angle<330):
        option=5
        
    elif (angle>=330 and angle<=360):
        option=6
        
    else:
        option=0
        
    return option

def listener():
    rospy.init_node('listener', anonymous=True)
    ConnectBelt(belt_addr)
    rospy.Subscriber("BeltStream", data, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()
