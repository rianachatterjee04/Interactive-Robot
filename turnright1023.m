brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("Turn Right Test")
% this is actually a left turn using a gyro sensor... the name "Turn Right"
% is misleading
brick.GyroCalibrate(2) 
gyroAngle = 0;
brick.ResetMotorAngle('AB');
while (gyroAngle > -90)
    brick.MoveMotor('A',10);
    motorAngle = brick.GetMotorAngle('A');
    fprintf('motorAngle is %d;', motorAngle)
    brick.MoveMotor('B',-10);
    pause(0.25);
    brick.StopAllMotors('Coast');
    pause(0.25);
    gyroAngle = brick.GyroAngle(2);
    fprintf('gyroAngle is %d\n', gyroAngle)    
end
brick.StopAllMotors('Coast');