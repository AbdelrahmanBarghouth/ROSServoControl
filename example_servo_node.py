import json
import rospy
import sys
import RPi.GPIO as GPIO
from std_msgs.msg import Float32

class Servo_node:
    def __init__(self):
        rospy.init_node('servo_node', anonymous=False)
        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BCM)
        # Setting up for pin 12. Make sure to adjust for your own needs
        GPIO.setup(26, GPIO.OUT)
        self.pwmX = GPIO.PWM(26, 50)
        self.pwmX.start(0)
        self.subX = rospy.Subscriber("/servo_ctrl/s1", Float32, self.set_x_servo_angle)

        GPIO.setup(12,GPIO.OUT)
        self.pwmY = GPIO.PWM(12, 50)
        self.pwmY.start(0)
        self.subY = rospy.Subscriber("/servo_ctrl/s2", Float32, self.set_y_servo_angle)

        GPIO.setup(13, GPIO.OUT)
        self.pwmZ = GPIO.PWM(13, 50)
        self.pwmZ.start(0)
        self.subZ = rospy.Subscriber("/servo_ctrl/s3", Float32, self.set_z_servo_angle)

    def set_x_servo_angle(self, msg):
        rospy.loginfo("setting servo x-axis")
        self.pwmX.ChangeDutyCycle(self.saturate_input(msg.data))# Note tha this does not correspond to angle

    def set_y_servo_angle(self, msg):
        rospy.loginfo("setting servo y-axis")
        self.pwmY.ChangeDutyCycle(self.saturate_input(msg.data))

    def set_z_servo_angle(self, msg):
        rospy.loginfo("setting servo z-axis")
        self.pwmZ.ChangeDutyCycle(self.saturate_input(msg.data))

    def saturate_input(self,a):
        return max(min(a,100),0)


def main_loop():
    rate = rospy.Rate(10)  # 10Hz
    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == "__main__":
    servo = Servo_node()
    main_loop()
