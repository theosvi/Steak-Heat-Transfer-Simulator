# Steak-Heat-Transfer-Simulator
A project that models heat transfer through a steak using a parabolic partial differential equation (PDE) to estimate the time required for the center to reach a specified target temperature.
Overview

This project explores the application of heat transfer modeling and numerical methods to a practical cooking problem.

The simulation models temperature evolution within a steak over time and estimates when the temperature at its center reaches a user-defined target.

Method

The model uses a parabolic PDE to describe heat conduction through the steak.

The simulation is based on assumptions about the steak's geometry, thermal properties, and boundary conditions. These assumptions are defined in the MATLAB code.

Requirements

MATLAB

How to Run

Clone or download this repository.

Open MATLAB and navigate to the project directory.

Open simulate_steak_cooking.m.

Set the model parameters, including the target center temperature.

Run the script to calculate the simulated temperature evolution and estimated cooking time.

Parameters

The model may include parameters such as:

Steak dimensions and geometry

Initial temperature

Target center temperature

Thermal conductivity

Density and specific heat capacity

Boundary conditions

Numerical discretization and time step

The exact parameters depend on the implementation.

Limitations

The estimated cooking time depends on the assumptions and parameter values used in the model. Actual cooking times may differ because of variations in steak thickness, initial temperature, grill conditions, and heat transfer at the steak's surface.

The simulation should be treated as a modeling exercise rather than a validated method for determining food safety.

Purpose

This project was created to practice MATLAB programming, numerical solutions of partial differential equations, heat transfer modeling, and version control using Git and GitHub.

Future Improvements

Compare simulated results with experimental measurements.

Explore different steak dimensions and initial conditions.

Investigate the effect of boundary conditions on the predicted cooking time.

Add plots showing the temperature distribution over time.
