//
//  Warrant.swift
//  Warehouse
//
//  Created by bruze on 12/8/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
protocol Warrant {
    //associatedtype Warranting

    static func warranted() -> Self
    
    static func deputy(key: String) -> Deputy<Self>
}

extension Warrant {
    static func deputy(key: String) -> Deputy<Self> {
        print("deputy created at \(Date())")
        return Deputy<Self>(key: key)
    }
}
