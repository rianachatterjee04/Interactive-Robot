brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
brick.MoveMotor('C', 100);
pause(5);
brick.StopAllMotors('Coast');
