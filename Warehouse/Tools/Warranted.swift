//
//  Warranted.swift
//  Warehouse
//
//  Created by bruze on 12/8/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
extension Int: Warrant {
    static func warranted() -> Int {
        return 0
    }
}

extension String: Warrant {
    static func warranted() -> String {
        return ""
    }
}
