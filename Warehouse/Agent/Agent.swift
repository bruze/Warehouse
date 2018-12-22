//
//  Agent.swift
//  Warehouse
//
//  Created by bruze on 12/10/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
protocol Agent {
    //associatedtype Represented: Warrant
    var warehouse: Warehouse? { get set }
    var key: String { get set }
    func into<V: Warrant>(_ variable: inout V)
}

extension SimpleAgent {
    func into<V>(_ variable: inout V) where V : Warrant {
        if let setVariable: V = self.warehouse?.get(key: self.key) {
            variable = setVariable
        }
    }
}

struct SimpleAgent: Agent {
    var warehouse: Warehouse?
    var key: String
}
