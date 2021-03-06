//
//  BackendRegisterFactoryTestDouble.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 30/12/2018.
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

@testable import SwiftQuantumComputing

// MARK: - Main body

final class BackendRegisterFactoryTestDouble {

    // MARK: - Internal properties

    private (set) var makeRegisterCount = 0
    private (set) var lastMakeRegisterBits: String?
    var makeRegisterResult: BackendRegister?
}

// MARK: - BackendRegisterFactory methods

extension BackendRegisterFactoryTestDouble: BackendRegisterFactory {
    func makeRegister(bits: String) throws -> BackendRegister {
        makeRegisterCount += 1

        lastMakeRegisterBits = bits

        if let makeRegisterResult = makeRegisterResult {
            return makeRegisterResult
        }

        throw BackendRegisterFactoryMakeRegisterError.provideNonEmptyStringComposedOnlyOfZerosAndOnes
    }
}
