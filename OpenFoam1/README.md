# OpenFOAM Lid-Driven Cavity Flow Simulation

This repository contains files and data for simulating the lid-driven cavity flow using OpenFOAM, specifically focusing on solving the incompressible Navier-Stokes equations in two dimensions. The simulations are performed on various mesh grids and Reynolds numbers to study the behavior of the flow.

## Contents

- **cavityTars**: Contains OpenFOAM tar files for each simulation, including different mesh grid resolutions and Reynolds numbers.
  
- **dataPoints**: Contains data files generated from the simulations at the last timestep.
  
- **matlabCode**: Includes MATLAB scripts used for data analysis and plotting of simulation results.

## Simulations

The lid-driven cavity flow simulations are conducted with the following configurations:

- Mesh Grids: 
  - 20x20
  - 40x40
  - 80x80
  - 160x160

- Reynolds Numbers (Re):
  - 80x80 grid with Re = 224
  - 80x80 grid with Re = 442

## Usage

To run the simulations,

1. Navigate to the desired simulation folder in `cavityTars`.
2. Extract the contents of the respective tar file.
3. Use OpenFOAM to set up and run the simulation on Paraview based on the provided case files.
4. Analyze the results/extract your own using the data files in `dataPoints` and MATLAB scripts in `matlabCode`.

## MATLAB Scripts

The MATLAB scripts provided in `matlabCode` can be used to visualize and analyze the simulation results. These scripts facilitate plotting of various flow characteristics and aid in interpreting the simulation data.

## Contributors

Kamilla Madera
Ben Juenger
William Marsh
