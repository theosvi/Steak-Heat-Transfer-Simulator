# Steak-Heat-Transfer-Simulator
A project that models heat transfer through a steak using a parabolic partial differential equation (PDE) to estimate the time required for the center to reach a specified target temperature.
Overview

The idea for creating this program originated from an individual university assignment for the "Scientific Computing" course, intended to help me become familiar with MATLAB. The solution is entirely my own, and the addition of further programs is also my own personal work.

This project explores the application of heat transfer modeling and numerical methods to a practical cooking problem.

The simulation models temperature evolution within a steak over time and estimates when the temperature at its center reaches a user-defined target.

Method

The model uses a parabolic PDE to describe heat conduction through the steak.

The simulation is based on assumptions about the steak's geometry, thermal properties, and boundary conditions. These assumptions are defined in the MATLAB code.

Requirements

MATLAB, g++ compiler

How to Run

Clone or download this repository.

Open MATLAB and navigate to the project directory.

Open simulate_steak_cooking.m.

Set the model parameters(Length,Hight), including the target center temperature, and -if wanted- add when the steak is flipped in the pan.

Run the script to calculate the simulated temperature evolution and estimated cooking time.

Parameters

The model may include parameters such as:

Steak dimensions and geometry

Initial temperature

Target center temperature

Time stamp ti indicate when the steak should be flipped

Thermal conductivity

Density and specific heat capacity

Boundary conditions

Numerical discretization and time step

The exact parameters depend on the implementation.

Limitations

The estimated cooking time depends on the assumptions and parameter values used in the model. Actual cooking times may differ because of variations in steak thickness, initial temperature, grill conditions, and heat transfer at the steak's surface.

This model does not take the room temperature into account; therefore, the transfer of heat from the steak to the room is not recognized. .

The simulation should be treated as a modeling exercise rather than a validated method for determining food safety.

Purpose

This project was created to practice numerical programming, , numerical solutions of partial differential equations, heat transfer modeling, and version control using Git and GitHub.

