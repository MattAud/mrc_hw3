% Matt Audette
% MRC Assignment 3, Part 4: Matlab tutorial.

%% Part 0:
% This is copy+pasted from the tutirial to get us started:

% Create a bag file object with the file name
% by omitting the semicolon this displays some information about
% the bag file
bag = rosbag('../data/myturtle.bag')
 
% Display a list of the topics and message types in the bag file
bag.AvailableTopics
 
% Since the messages on topic turtle1/pose are of type Twist,
% let's see some of the attributes of the Twist message
msg_pose = rosmessage('turtlesim/Pose')
showdetails(msg_pose)
 
% Get just the topic we are interested in
bagselect = select(bag,'Topic','turtle1/pose');
 
% Create a time series object based on the fields of the turtlesim/Pose
% message we are interested in
ts = timeseries(bagselect,'X','Y','Theta','LinearVelocity','AngularVelocity');

%% Part 1:
% plot the x and y location of your turtle 
% save it was matlab/pose_xy.png:

xy_position = timeseries(bagselect, 'X', 'Y');
figure(1)
plot(xy_position)
title("Part 1: plot X and Y Location")
grid on
grid minor

%% Part 2:
% plot the heading angle theta of the turtle
% as a function of time:
% save it as matlab/pose_theta.png

theta_ts = timeseries(bagselect, 'Theta');
figure(2)
plot(theta_ts)
title("Part 2: Plot of Heading Theta")
grid on
grid minor

%% Part 3: 
%plot a quiver plot showing the location and heading
% of the turtle. Save the file as
% matlab/pose_quiver.png
% % x_ts = timeseries(bagselect, 'X');
% % x = x_ts.data(:,1);
% % x = ts.data(1, :);
% % y_ts = timeseries(bagselect, 'Y');
% % y = y_ts.data(:,1);
% % vel_ts = timeseries(bagselect, 'LinearVelocity');
% % vel = vel_ts.data(:,1);
% % th_ts = timeseries(bagselect, 'Theta');
% % th = th_ts.data(:,1);
x = ts.data(:, 1);
y = ts.data(:, 2);
th = ts.data(:, 3);
vel = ts.data(:, 4);

u = vel.*cos(th);
v = vel.*sin(th);
ii = 1:10:length(x);  % Decimate the data so that it plot only every Nth point.
figure(3)
quiver(x(ii),y(ii),u(ii),v(ii))
grid on
grid minor
title("Quiver Plot")


