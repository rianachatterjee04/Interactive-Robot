brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
disp("distance test")
brick.ResetMotorAngle('AB')
pause(1)
while(1)
    brick.MoveMotor('AB', -50)
    angle = brick.GetMotorAngle('A');
    disp(angle)
    pause(0.1);
end