# Experiments with Reruning under Uncertainty in Initial States

## Motivation

To examine the changes in behavior when running the simulator with small uncertainty in initial states


## Procedures to minimize other uncertainties

- Nondeterministic order in launching

  + Launch all ROS nodes with simulated time paused in the initialization phase.

- Randomness in simulator

  + Set a predefined random seed for Gazebo using `--seed` option

- Jitter

  + Slowdown the simulation physics profile to ensure that the wall time of each cycle is much larger than the jitter.
    Equivalently, the jitter in simulated time is reduced.

- Communication delay to the recorder node

  + Set TCP_NODELAY for `rosbag record`
  + Alternatively, use stamped values as messages.
    The timestamp is from the sender; hence to minimize clock skew, we run the whole simulation on the same computer.
