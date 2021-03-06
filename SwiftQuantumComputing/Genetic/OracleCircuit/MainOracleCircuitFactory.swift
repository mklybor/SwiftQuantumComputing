//
//  MainOracleCircuitFactory.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 17/02/2019.
//  Copyright © 2019 Enrique de la Torre. All rights reserved.
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

import Foundation

// MARK: - Main body

struct MainOracleCircuitFactory {}

// MARK: - OracleCircuitFactory methods

extension MainOracleCircuitFactory: OracleCircuitFactory {
    func makeOracleCircuit(geneticCircuit: [GeneticGate],
                           useCase: GeneticUseCase) throws -> OracleCircuit {
        let tt = useCase.truthTable.truth
        let ttCount = useCase.truthTable.qubitCount

        var gates: [FixedGate] = []
        var oracleIndex: Int? = nil

        for (index, gg) in geneticCircuit.enumerated() {
            var fixed: GeneticGate.Fixed!
            do {
                fixed = try gg.makeFixed(truthTable: tt, truthTableQubitCount: ttCount)
            } catch GeneticGateMakeFixedError.truthTableQubitCountHasToBeBiggerThanZero {
                throw OracleCircuitFactoryMakeOracleCircuitError.truthTableQubitCountHasToBeBiggerThanZeroToMakeOracle(at: index)
            } catch GeneticGateMakeFixedError.truthTableRequiresMoreInputQubitsThatAreAvailable {
                throw OracleCircuitFactoryMakeOracleCircuitError.truthTableRequiresMoreInputQubitsThatAreAvailableToMakeOracle(at: index)
            } catch {
                fatalError("Unexpected error: \(error).")
            }

            var doAppendGate = true
            if fixed.didUseTruthTable {
                doAppendGate = (oracleIndex == nil)
                oracleIndex = (doAppendGate ? index : oracleIndex)
            }

            if doAppendGate {
                gates.append(fixed.gate)
            }
        }

        return (gates, oracleIndex)
    }
}
