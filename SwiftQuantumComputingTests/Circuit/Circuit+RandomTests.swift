//
//  Circuit+RandomTests.swift
//  SwiftQuantumComputingTests
//
//  Created by Enrique de la Torre on 28/08/2018.
//  Copyright © 2018 Enrique de la Torre. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import XCTest

@testable import SwiftQuantumComputing

// MARK: - Main body

class Circuit_RandomTests: XCTestCase {

    // MARK: - Tests

    func testCorrectCircuitMatricesWithSameQubitCountThanCircuitAndNegativeDepth_applyingGates_returnNil() {
        // Given
        let circuit = CircuitTestDouble()

        var randomGateCount = 0
        let randomGate: (() -> CircuitGate?) = {
            randomGateCount += 1

            return CircuitGate.makePhaseShift(radians: 0)
        }

        var shuffledQubitsCount = 0
        let shuffledQubits: (() -> [Int]) = {
            shuffledQubitsCount += 1

            return [0]
        }

        let depth = -1

        // When
        let result = circuit.applyingGates(randomlySelectedWith: randomGate,
                                           on: shuffledQubits,
                                           depth: depth)

        // Then
        XCTAssertEqual(randomGateCount, 0)
        XCTAssertEqual(shuffledQubitsCount, 0)
        XCTAssertEqual(circuit.applyingGateCount, 0)
        XCTAssertNil(result)
    }

    func testCorrectCircuitMatricesWithSameQubitCountThanCircuitAndDepthEqualToZero_applyingGates_returnSameCircuit() {
        // Given
        let circuit = CircuitTestDouble()

        var randomGateCount = 0
        let randomGate: (() -> CircuitGate?) = {
            randomGateCount += 1

            return CircuitGate.makeHadamard()
        }

        var shuffledQubitsCount = 0
        let shuffledQubits: (() -> [Int]) = {
            shuffledQubitsCount += 1

            return [0]
        }

        let depth = 0

        // When
        let result = circuit.applyingGates(randomlySelectedWith: randomGate,
                                           on: shuffledQubits,
                                           depth: depth)

        // Then
        XCTAssertEqual(randomGateCount, 0)
        XCTAssertEqual(shuffledQubitsCount, 0)
        XCTAssertEqual(circuit.applyingGateCount, 0)
        XCTAssertTrue(result === circuit)
    }

    func testCorrectCircuitZeroMatricesAndPositiveDepth_applyingGates_returnSameCircuit() {
        // Given
        let circuit = CircuitTestDouble()

        var randomGateCount = 0
        let randomGate: (() -> CircuitGate?) = {
            randomGateCount += 1

            return nil as CircuitGate?
        }

        var shuffledQubitsCount = 0
        let shuffledQubits: (() -> [Int]) = {
            shuffledQubitsCount += 1

            return [0]
        }

        let depth = 10

        // When

        let result = circuit.applyingGates(randomlySelectedWith: randomGate,
                                           on: shuffledQubits,
                                           depth: depth)

        // Then
        XCTAssertEqual(randomGateCount, depth)
        XCTAssertEqual(shuffledQubitsCount, 0)
        XCTAssertEqual(circuit.applyingGateCount, 0)
        XCTAssertTrue(result === circuit)
    }

    func testCorrectCircuitMatricesWithSameOrLessQubitCountThanCircuitAndPositiveDepth_applyingGates_returnExpectedCircuit() {
        // Given
        let lastCircuit = CircuitTestDouble()
        var circuits = [lastCircuit]

        let qubits = [0, 1]
        let depth = 10

        var expectedGates: [CircuitGate] = []
        var expectedQubitsArray: [[Int]] = []

        var isEven = true
        for _ in 0..<depth {
            let circuit = CircuitTestDouble()
            circuit.applyingGateResult = circuits[0]
            circuits.insert(circuit, at: 0)

            expectedGates.append(isEven ? CircuitGate.makeControlledNot() : CircuitGate.makeNot())
            expectedQubitsArray.append(isEven ? qubits : [qubits.first!])

            isEven = !isEven
        }

        var randomGateCount = 0
        let randomGate: (() -> CircuitGate?) = {
            let gate = expectedGates[randomGateCount]
            randomGateCount += 1

            return gate
        }

        var shuffledQubitsCount = 0
        let shuffledQubits: (() -> [Int]) = {
            shuffledQubitsCount += 1

            return [0, 1]
        }

        // When
        let result = circuits[0].applyingGates(randomlySelectedWith: randomGate,
                                               on: shuffledQubits,
                                               depth: depth)

        // Then
        XCTAssertEqual(randomGateCount, depth)
        XCTAssertEqual(shuffledQubitsCount, depth)

        for i in 0..<depth {
            XCTAssertEqual(circuits[i].applyingGateCount, 1)
            XCTAssertEqual(circuits[i].lastApplyingGateGate?.matrix, expectedGates[i].matrix)
            XCTAssertEqual(circuits[i].lastApplyingGateInputs, expectedQubitsArray[i])
        }

        XCTAssertTrue(result === lastCircuit)
    }
}
