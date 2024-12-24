#!/bin/bash

echo "ROS2 version is: ${ROS_VERSION}"
echo "ROS2 distro is: ${ROS_DISTRO}"
echo "ROS2 workspace is: ${ROS_WORKSPACE}"

echo "building 3rd party firstly"
echo "building Sophus.........................."     # for arise_slam_360
cd src/slam/dependency/Sophus && ./build.sh

echo "building gtsam based on Eigen Systemly..."     # avoid : assertion failed: Error: GTSAM was built against a different version of Eigen
cd ../gtsam/ && ./build.sh
cd ../../../..                                       # back to the root of the /autonomy_stack_diablo_setup/ workspace directory

echo "building livox_ros_driver2"
colcon build --cmake-args -DROS_EDITION=${ROS_VERSION} -DHUMBLE_ROS=${ROS_DISTRO}  --packages-select livox_ros_driver2

echo "building autonomy_stack_diablo_setup"
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release