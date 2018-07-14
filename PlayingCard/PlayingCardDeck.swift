//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Alvin Tan De Jun on 11/7/18.
//  Copyright © 2018 Alvin Tan. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    var deck = [PlayingCard]()
    
    init(){
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                deck.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if deck.count > 0 {
            return deck.remove(at: deck.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
