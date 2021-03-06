//
//  GeneticUseCaseCircuitEvaluationError.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 20/04/2019.
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

// MARK: - Errors

public enum GeneticUseCaseEvaluationError: Error {
    case evaluatorForCircuitWithMoreQubits
    case useCaseTruthTableQubitCountHasToBeBiggerThanZeroToMakeOracle
    case useCaseTruthTableRequiresMoreInputQubitsThatAreAvailableToMakeOracle
    case useCaseCircuitInputHasToBeANonEmptyStringComposedOnlyOfZerosAndOnes
    case useCaseCircuitOutputHasToBeANonEmptyStringComposedOnlyOfZerosAndOnes
    case useCaseCircuitOutputHasMoreQubitsThatCircuitHas
    case unableToExtractMatrix(gate: FixedGate)
    case gateMatrixIsNotSquare(gate: FixedGate)
    case gateMatrixRowCountHasToBeAPowerOfTwo(gate: FixedGate)
    case gateMatrixHandlesMoreQubitsThanAreAvailable(gate: FixedGate)
    case gateInputCountDoesNotMatchMatrixQubitCount(gate: FixedGate)
    case gateInputsAreNotUnique(gate: FixedGate)
    case gateInputsAreNotInBound(gate: FixedGate)
    case gateIsNotUnitary(gate: FixedGate)
    case gateDoesNotHaveValidDimension(gate: FixedGate)
    case additionOfSquareModulusIsNotEqualToOneAfterApplyingGate(gate: FixedGate)
}
