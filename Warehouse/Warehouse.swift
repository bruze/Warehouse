//
//  Warehouse.swift
//  Warehouse
//
//  Created by bruze on 12/8/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation

infix operator <&
func <&<W: Warrant>(ware: (Warehouse, String), value: inout W) {
    value = ware.0.get(key: Deputy<W>(key: ware.1))
}

prefix operator &=
func &=<W: Warrant>(value: Warehouse, other: (String, W)) {
    value.set(other.0, other.1)
}

func &=<W: Warrant>(value: Warehouse, other: @escaping @autoclosure () -> (String, (W) -> W)) {
    let other = other()
    let deputy = value.get(key: W.deputy(key: other.0))
    value.set(other.0, other.1(deputy))
}

class Warehouse {
    private var stored: [String: Any] = ["Chinga": " Tu madre ", "key": 202]
    
    func get<V>(key: Deputy<V>) -> V where V : Warrant {
        if let stored = self.stored[key.key] as? V {
            return stored
        }
        return key.value
    }
    
    func get<V>(key: String) -> V where V : Warrant {
        if let stored = self.stored[key] as? V {
            return stored
        }
        return V.warranted()
    }
    
    func put(_ key: String) -> Agent {
        return SimpleAgent(warehouse: self, key: key)
    }
    
    func retrieve<V>(_ key: String, _ completion: @escaping (V) -> (V)) where V : Warrant {
        let deputy = self.get(key: V.deputy(key: key))
        let final = completion(deputy)
        print("Final \(final)")
    }
    
    func set<V>(_ key: String, _ completion: @escaping @autoclosure () -> (V)) where V : Warrant {
        self.stored[key] = completion()
    }
    
    func put<V>(_ key: String, _ value: V) where V : Warrant {
        self.stored[key] = value
    }
    
    func put<V>(_ key: String, into value: inout V) where V : Warrant {
        if let stored = self.stored[key] as? V {
            value = stored
        }
    }
    
    /*func put(_ key: String) -> (Warehouse, String) {
        return (self, key)
    }*/
        
    //func set(key: String, value: V)
    init() {
        /*self &= ("key", 1)
        
        let chingaTuMadre = self.get(key: StringDeputy(key: "Chinga"))
        let sopor = self.get(key: Int.deputy(key: "key"))
        
        self.retrieve("key", { $0 + 1 })
        self.retrieve("Chinga", { _ in "CHINGA TU WEY" })
        
        self.put("key", 11)
        
        print(chingaTuMadre + "WEY")
        print(sopor)*/
    }
    
    
}
