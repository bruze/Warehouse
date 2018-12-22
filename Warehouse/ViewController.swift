//
//  ViewController.swift
//  Warehouse
//
//  Created by Bruno Garelli on 10/15/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ware = Warehouse()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        ware &= ("key", 2)
        //ware &= ("poronga", "poronga")
        ware.set("poronga", "poronga")
        ware &= ("poronga", {$0 + " china"})
        var chota = ""
        //ware.put("poronga") <& chota
        ware.put("poronga", into: &chota)
        print(chota)
        print(ware.get(key: Int.deputy(key: "key")))
        print(ware.get(key: String.deputy(key: "poronga")))
        */
        self.makeSquare()
    }
    
    private func makeSquare() {
        var top = ""
        var middle = ""
        var bottom = ""
        
        ware.set("top", " _ ")
        ware.set("middle", "I I")
        ware.set("bottom", " - ")
        
        ware.put("top", into: &top)
        ware.put("middle", into: &middle)
        ware.put("bottom", into: &bottom)
        
        ware.set("cacaroto", """
            {[o_o]}
            -  * -
            __¡ ¡__
        """)
        let sorongo: String = ware.get(key: "cacaroto")
        ware.put("cacaroto").into(&middle)
        
        /*print(top)
        print(middle)
        print(bottom)*/
        print(sorongo)
        ware.set("cacaroto", """
            {[o o]}
            -  # -
            __¡ ¡__
        """)
        print(sorongo == middle)
    }


}

