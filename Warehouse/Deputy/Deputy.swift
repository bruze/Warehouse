//
//  Deputy.swift
//  Warehouse
//
//  Created by bruze on 12/8/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
class Deputy<V: Warrant> {
    let key: String
    var value: V
    
    required init(key: String, overrideDefaultValue: V = V.warranted()) {
        self.key = key
        self.value = overrideDefaultValue
    }
}
