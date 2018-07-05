%% Initializing Pi
pi=raspi('169.254.0.2','pi','raspberry');
%% Initialise ros on this PC
setenv('ROS_IP','169.254.0.3');
rosinit
%% SSH the pi
pi.openShell
%% Define Subscriber to the pi topic publisher
positionSub = rossubscriber('/probePosition/x_y');
%% Create new topics and publsihers
pwmPubx = rospublisher('/servo_ctrl/s1','std_msgs/Float32');
pwmPuby = rospublisher('/servo_ctrl/s2','std_msgs/Float32');
pwmPubz = rospublisher('/servo_ctrl/s3','std_msgs/Float32');
%% Adjusting Position
positionSub.NewMessageFcn=@(~,msg)adjustProbePosition(pwmPubx, pwmPuby, msg);
%% Controlling Z not used till now 
pulseWidthz = 0;
dutyCyclez = rosmessage('std_msgs/Float32');
dutyCyclez.Data = (pulseWidthz/20)*100;
send(pwmPubz, dutyCyclez);
