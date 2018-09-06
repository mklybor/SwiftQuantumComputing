//
//  CircuitOracleGateDescriber.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 05/09/2018.
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

import Foundation

// MARK: - Main body

struct CircuitOracleGateDescriber {}

// MARK: - CircuitGateDescribable methods

extension CircuitOracleGateDescriber: CircuitGateDescribable {
    var gateDescription: String {
        return "U"
    }

    func parameters(in inputs: [Int]) -> (targets: [Int], controls: [Int]) {
        return (targets: inputs, controls: [])
    }
}

