#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR
source ./install/setup.bash
./src/base_autonomy/vehicle_simulator/mesh/unity/environment/Model.x86_64 &
sleep 3 
ros2 launch vehicle_simulator system_simulation.launch &
sleep 1
ros2 run rviz2 rviz2 -d src/slam/arise_slam_mid360/ros2.rviz
sleep 1
ros2 launch arise_slam_mid360 arize_slam.launch.py