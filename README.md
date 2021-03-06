# A quantum circuit simulator in Swift

[![CI Status](https://travis-ci.org/indisoluble/SwiftQuantumComputing.svg)](https://travis-ci.org/indisoluble/SwiftQuantumComputing)
[![codecov.io](https://codecov.io/github/indisoluble/SwiftQuantumComputing/coverage.svg)](https://codecov.io/github/indisoluble/SwiftQuantumComputing)
[![Version](https://img.shields.io/cocoapods/v/SwiftQuantumComputing.svg)](http://cocoapods.org/pods/SwiftQuantumComputing)
![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey.svg)

In this repository you can find a quantum circuit simulator written in Swift and speeded up with Accelerate.framework. Along side the simulator there is also a genetic algorithm to automatically generate circuits able to solve a given quantum problem.

The code written so far is mostly based on the content of: [Quantum Computing for Computer Scientists](https://www.amazon.com/Quantum-Computing-Computer-Scientists-Yanofsky/dp/0521879965), with a few tips from [Automatic Quantum Computer Programming: A Genetic Programming Approach](https://www.amazon.com/Automatic-Quantum-Computer-Programming-Approach/dp/038736496X). It is also inspired by [IBM Qiskit](https://github.com/Qiskit/qiskit-terra).

## Usage

To create a circuit gate by gate:

![Deutsch's Algorithm](https://raw.githubusercontent.com/indisoluble/SwiftQuantumComputing/master/Images/DeutschAlgorithm.jpg)

Check `DeutschAlgorithm.playground` for the actual code.

Or check `Genetic.playground` to see how to configure the genetic algorithm to produce a quantum circuit:

![Circuit generated with a genetic algorithm](https://raw.githubusercontent.com/indisoluble/SwiftQuantumComputing/master/Images/Genetic.jpg)
