//
//  ArrayShuffle.swift
//  FlagMemoryCards
//
//  Created by Justin Lewis on 7/19/17.
//  Copyright © 2017 DevTrain. All rights reserved.
//

import Foundation

extension Array {
    //Randomizes the order of the array elements
    mutating func shuffle() {
        for _ in 1...self.count {
            self.sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

