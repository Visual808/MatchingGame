//
//  DeckOfCards.swift
//  FlagMemoryCards
//
//  Created by Justin Lewis on 7/19/17.
//  Copyright © 2017 DevTrain. All rights reserved.
//

import Foundation

struct DeckOfCards {
    
    var nameList = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada"]
    
    var dealtCards : [String] = []
    
    let numberOfMatches = 6
    
    init() {
        drawCards()
    }
    
    mutating func drawCards() {
        dealtCards.removeAll()
        nameList.shuffle()
        for i in 0..<numberOfMatches {
            dealtCards.append(nameList[i])
            dealtCards.append(nameList[i])
        }
        dealtCards.shuffle()

    }
    
}



