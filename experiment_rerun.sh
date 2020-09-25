#!/bin/bash

DEVEL_DIR=$HOME/gem_replay/sim_ws/devel_isolated
BAG_DIR=$HOME/gem_replay/bags

source ${DEVEL_DIR}/setup.bash


# Launch ROS nodes Gazebo simulator in background
roslaunch exp_rerun left_turn.launch bag_dir:=${BAG_DIR} &
ROSLAUNCH_PID=$!

# Wait for all nodes finish initialization
sleep 15s

# Unpause to start simulation
rosservice call --wait /gazebo/unpause_physics

# Wait for background roslaunch to finish
wait ${ROSLAUNCH_PID}
