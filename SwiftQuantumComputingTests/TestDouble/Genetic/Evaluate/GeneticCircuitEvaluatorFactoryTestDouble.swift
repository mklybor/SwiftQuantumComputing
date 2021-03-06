//
//  GeneticCircuitEvaluatorFactoryTestDouble.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 24/02/2019.
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

@testable import SwiftQuantumComputing

// MARK: - Main body

final class GeneticCircuitEvaluatorFactoryTestDouble {

    // MARK: - Internal properties

    private (set) var makeEvaluatorCount = 0
    private (set) var lastMakeEvaluatorQubitCount: Int?
    private (set) var lastMakeEvaluatorThreshold: Double?
    private (set) var lastMakeEvaluatorUseCases: [GeneticUseCase]?
    var makeEvaluatorResult: GeneticCircuitEvaluator?
}

// MARK: - GeneticCircuitEvaluatorFactoryTestDouble methods

extension GeneticCircuitEvaluatorFactoryTestDouble: GeneticCircuitEvaluatorFactory {
    func makeEvaluator(qubitCount: Int,
                       threshold: Double,
                       useCases: [GeneticUseCase]) throws -> GeneticCircuitEvaluator {
        makeEvaluatorCount += 1

        lastMakeEvaluatorQubitCount = qubitCount
        lastMakeEvaluatorThreshold = threshold
        lastMakeEvaluatorUseCases = useCases

        if let makeEvaluatorResult = makeEvaluatorResult {
            return makeEvaluatorResult
        }

        throw GeneticCircuitEvaluatorFactoryMakeEvaluatorError.qubitCountHasToBeBiggerThanZero
    }
}
