# This is from Assignment 3.
# End goal is to write the first two letters in your name in two different colors.

# in a terminal
# $ roscore                                                      
# in another terminal window: 
# $ rosrun turtlesim turtlesim_node                   
# in a third terminal window:                                         
# $ cd ~/catkin_ws/src/mrc_hw3/scripts                               
# $ bash turtleletterstwo.sh #will run this script

# Clear the workspace:
rosservice call /clear

# practice using Parameters to set the background color:
rosparam set /background_r 0
# Clear the service to make the change happen:
rosservice call /clear

# Drop a turtle, name it turle1:
rosservice call /spawn 1 5 1.5 "turtle2"

# make turtle2's pen green:
rosservice call turtle2/set_pen '0' '255' '0' '2' '0'

      
# turtle2 draws the 'M'                                              
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[3.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
# Turn right:
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[1.0, 0.0, 0.0]' '[0.0, 0.0, -2.7]'
#Go straight: \
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[3.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
#turn left to face up:
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, 2.5]'
#Go straight: /
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[3.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
#Turn right to go down: 
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[1.0, 0.0, 0.0]' '[0.0, 0.0, -2.7]'
#Go straight down: \
rostopic pub -1 /turtle2/cmd_vel geometry_msgs/Twist -- '[3.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
# M is complete.


# tutrle 1 draws the 'a':
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[8.0, 0.0, 0.0]' '[0.0, 0.0, 8.0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[-1.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'

rosservice call /kill turtle2
rosservice call /kill turtle1
