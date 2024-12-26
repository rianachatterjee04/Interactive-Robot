# Brick Robotics Control Scripts 🤖

This repository contains a collection of MATLAB scripts designed for controlling a LEGO EV3 robot using the Brick framework over Wi-Fi. The scripts implement various functionalities, such as motor control, sensor integration, obstacle detection, and automated navigation.

---

## Project Hierarchy 📂

```
Brick Robotics Control Scripts/
├── Motor Control/
│   ├── Brick_MotorAngleRel_Test.m          # Test motor angle-based relative movements
│   ├── Brick_LeftRight_Turns.m            # Execute precise left and right turns
│   └── Brick_360DegreeGyroTurn.m          # Full 360-degree turn using gyro sensors
├── Navigation/
│   ├── Brick_PedestrianZone_Detection.m   # Navigate zones and detect pedestrians
│   ├── Brick_Rocket_RightTurn_SensorTest.m # Perform right turns and handle sensor readings
│   └── Brick_Distance_RightTurn.m         # Combine turns with distance detection
├── Obstacle Detection/
│   ├── Brick_ColorDistance_Control.m      # Movement based on color and ultrasonic sensors
│   ├── Brick_ObstacleAvoidance.m          # Avoid obstacles using touch and ultrasonic sensors
│   └── Brick_TouchSensor_DirectionTest.m  # Turn handling based on touch sensor inputs
├── Tests/
│   ├── Brick_TurnRight_GyroTest.m         # Gyro-based turn test
│   └── Brick_FullTurn_WithSensors.m       # Full turn while interacting with sensors
├── README.md                              # Project documentation
└── LICENSE                                # License information
```

---

## Features ✨

- **Motor Control**: Fine-tuned motor angle adjustments, directional movement, and complete rotations.
- **Navigation**: Zone detection, pedestrian interactions, and real-time adjustments using sensors.
- **Obstacle Detection**: Integrated touch, color, and ultrasonic sensors for dynamic obstacle avoidance.
- **Testing Utilities**: Modular scripts for individual feature testing and debugging.

---

## Installation 🛠️

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/brick-robotics-scripts.git
   ```

2. Ensure MATLAB and the Brick framework are installed.

3. Update the IP address in the scripts to match your LEGO EV3 Wi-Fi configuration:
   ```matlab
   brick = Brick('ioType', 'wifi', 'wfAddr', '127.0.0.1', 'wfPort', 5555, 'wfSN', '0016533dbaf5');
   ```

---

## Usage 🚀

1. Navigate to the relevant script folder:
   ```bash
   cd Brick\ Robotics\ Control\ Scripts/Motor\ Control/
   ```

2. Open the desired script in MATLAB and run it:
   ```matlab
   Brick_MotorAngleRel_Test
   ```

3. Review robot behavior and make adjustments as needed.

---

## Contributing

Here's how to contribute:
1. Fork this repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-name
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Added new feature"
   ```
4. Push to your fork and submit a pull request.

---
