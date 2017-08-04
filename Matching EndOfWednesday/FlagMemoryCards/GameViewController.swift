//
//  GameViewController.swift
//  FlagMemoryCards
//
//  Created by Justin Lewis on 7/17/17.
//  Copyright © 2017 DevTrain. All rights reserved.
//

import UIKit
import LTMorphingLabel

class GameViewController: UIViewController, MatchingGameDelgate {
    
    var game = Game()
    var gameNumber = 1
    
    @IBOutlet weak var gameLabel: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.gameDelegate = self
        gameLabel.morphingEffect = .burn
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        let tagNum = sender.tag
        if game.flipCard(atIndexNumber: tagNum-1) {
            let thisImage = UIImage(named: game.deckOfCards.dealtCards[tagNum - 1])

            UIView.transition(with: sender, duration: 0.5, options: .transitionFlipFromRight, animations: {
                sender.setImage(thisImage, for: .normal)
            }, completion: nil)
            
      
        }
     }
    
    @IBAction func newGame(_ sender: UIButton) {
        for tagNum in 1...12 {
            if let thisButton = self.view.viewWithTag(tagNum) as? UIButton {
                
                UIView.transition(with: thisButton, duration: 0.2, options: .transitionFlipFromTop, animations: {
                    thisButton.setImage(#imageLiteral(resourceName: "CardBack"), for: .normal)
                }, completion: nil)
            }
        }
        gameNumber += 1
        gameLabel.text = "Game #\(gameNumber)"
        
        game.newGame()
        
    }
    
    func game(_ game: Game, hideCards cards: [Int]) {
        
        let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            
            for cardIndex in cards {
                if let thisButton = self.view.viewWithTag(cardIndex+1) as? UIButton {
                    
                    UIView.transition(with: thisButton, duration: 0.2, options: .transitionFlipFromLeft, animations: {
                        thisButton.setImage(#imageLiteral(resourceName: "CardBack"), for: .normal)
                    }, completion: nil)
                    
                }
            }
            self.game.waitingForHidingCards = false  //All unmatched cards are hidden

            
        }
        
            
            
       
    }
    
    
    
 

}

