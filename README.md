# A Quantum Computing experiment based on Swift

[![CI Status](https://travis-ci.org/indisoluble/SwiftQuantumComputing.svg)](https://travis-ci.org/indisoluble/SwiftQuantumComputing)
[![codecov.io](https://codecov.io/github/indisoluble/SwiftQuantumComputing/coverage.svg)](https://codecov.io/github/indisoluble/SwiftQuantumComputing)

In this repository you can find a simple quantum circuit simulator written in Swift.

Over time and as I learn more about quantum computing, I will add more Swift code to experiment with these concepts.

The code written so far is mostly based on the content of: [Quantum Computing for Computer Scientists](https://www.amazon.com/Quantum-Computing-Computer-Scientists-Yanofsky/dp/0521879965), with a few tips from [Automatic Quantum Computer Programming: A Genetic Programming Approach](https://www.amazon.com/Automatic-Quantum-Computer-Programming-Approach/dp/038736496X). It is also inspired by [IBM Qiskit](https://github.com/Qiskit/qiskit-terra).

## Usage

To create an circuit step by step (or gate by gate):

```swift
import SwiftQuantumComputing

print("Deutsch's Algorithm")
print("Function: (f(0) = 1, f(1) = 0)")
let uf = Matrix([[Complex(0), Complex(1), Complex(0), Complex(0)],
                 [Complex(1), Complex(0), Complex(0), Complex(0)],
                 [Complex(0), Complex(0), Complex(1), Complex(0)],
                 [Complex(0), Complex(0), Complex(0), Complex(1)]])!
print("Uf:")
print(uf)

var circuit = CircuitFactory.makeEmptyCircuit(qubitCount: 2)!
circuit = circuit.applyingNotGate(to: 0)!
circuit = circuit.applyingHadamardGate(to: 1)!
circuit = circuit.applyingHadamardGate(to: 0)!
circuit = circuit.applyingGate(builtWith: uf, inputs: [1, 0])!
circuit = circuit.applyingHadamardGate(to: 1)!

let measure = circuit.measure(qubits: 1)!

print("Is it constant? \(abs(1 - measure[0]) < 0.001)")
print()
```

For a more detailed example, check `DeutschAlgorithm.playground`.

You can also create a circuit with a pre-selected list of gates added at random:

```swift
import SwiftQuantumComputing

let uf = Matrix([[Complex(0), Complex(1), Complex(0), Complex(0)],
                 [Complex(1), Complex(0), Complex(0), Complex(0)],
                 [Complex(0), Complex(0), Complex(1), Complex(0)],
                 [Complex(0), Complex(0), Complex(0), Complex(1)]])!

let gateMatrices = [Matrix.makeNot(), Matrix.makeHadamard(), uf]

let circuit = CircuitFactory.makeRandomlyGeneratedCircuit(qubitCount: 2,
                                                          depth: 5,
                                                          gateMatrices: gateMatrices)!

print("Measures: \(circuit.measure(qubits: 1, 0)!)")
print()
```
