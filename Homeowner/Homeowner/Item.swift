//
//  Item.swift
//  Homeowner
//
//  Created by teacher on 10/18/16.
//  Copyright © 2016 Syracuse University. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    //designated Intializer
    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    //convenience initializer
    convenience init(random: Bool) {
        if random {
            let adjectives = ["Shiny", "Rusty", "Fluffy"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var index = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(index)]
            
            index = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(index)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            
            let randomValueInDollars = Int(arc4random_uniform(101))
            let randomSerialNumber = "SN" + "\(arc4random_uniform(1000))"
            
            self.init(name: randomName, valueInDollars: randomValueInDollars, serialNumber: randomSerialNumber)
            
        }
        else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
    }
    
}
