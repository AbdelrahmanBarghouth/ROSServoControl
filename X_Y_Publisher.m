%% Intialize Publisher and Message
probePositionPub = rospublisher('/probePosition/x_y','std_msgs/Float32MultiArray');
x_y_position = rosmessage('std_msgs/Float32MultiArray');
%% Initial
x_y_position.Data=[0,0.5];
send(probePositionPub, x_y_position);
%% Writing my name "Abdo"
%4          # # #    # # #
%3    #     #    #   #     #     # #
%2   # #    # # #    #     #   #     #
%1  # # #   #    #   #     #   #     #
%0 #     #  # # #    # # #       # #
%  0 1 2 3  0 1 2 3  0 1 2 3   0 1 2 3
%After each letter I make the probe go to (0,0)
%% Drawing sin wave
for coord_y=0.5:0.1:3.14*2
    coord_x = abs(sin(coord_y)*3);
    x_y_position.Data = [coord_x,coord_y/1.5];
    send(probePositionPub, x_y_position);
%     disp(x_y_position.Data)
    pause(0.3);
end
%% Drawing letter A
A_coordinates = [0.5,1; 1,2; 1.5,3; 2,2; 2.5,1; 0.5,1; 2.5,1; 3,0];
%fast_A = [0,0; 0,4; 3,4; 3,2; 0,2; 3,2; 3,0];
for i=1:length(A_coordinates)
    x_y_position.Data = [A_coordinates(i,1),A_coordinates(i,2)];
    send(probePositionPub, x_y_position);
%     disp(x_y_position.Data)
    pause(0.5);
end
pause(1);
%% Drawing letter B
B_coordinates = [0,1; 0,2; 0,3; 0,4; 1,4; 2,4; 3,4; 2.5,3; 2,2; 1,2; 0,2; 1,2; 2,2; 2.5,1; 3,0; 2,0; 1,0; 0,0];
fast_B = [0,0; 0,4; 3,4; 3,3; 2,2; 0,2; 2,2; 3,1; 3,0; 0,0];
for i=1:length(B_coordinates)
    x_y_position.Data = [B_coordinates(i,1),B_coordinates(i,2)];
    send(probePositionPub, x_y_position);
    pause(0.5);
end
pause(1);
%% Drawing letter D
D_coordinates = [0,0; 0,1; 0,2; 0,3; 0,4; 1,4; 2,4; 3,3; 3,2; 3,1; 2,0; 1,0; 0,0];
fast_D = [0,0; 0,4; 2,4; 3,3; 3,1; 2,0; 0,0];
for i=1:length(D_coordinates)
    x_y_position.Data = [D_coordinates(i,1),D_coordinates(i,2)];
    send(probePositionPub, x_y_position);
    pause(0.5);
end
pause(1);
%% Drawing letter O
O_coordinates = [0,1; 0,2; 1,3; 2,3; 3,2; 3,1; 2,0; 1,0; 0,1];
fast_O = [0,0; 0,4; 3,4; 3,2; 0,2; 3,2; 3,0];
for i=1:length(O_coordinates)
    x_y_position.Data = [O_coordinates(i,1),O_coordinates(i,2)];
    send(probePositionPub, x_y_position);
    pause(0.5);
end
pause(1);
