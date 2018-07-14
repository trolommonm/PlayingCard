//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Alvin Tan De Jun on 10/7/18.
//  Copyright © 2018 Alvin Tan. All rights reserved.
//

import Foundation

// implement CustomStringConvertible protocol
struct PlayingCard: CustomStringConvertible {
    var description: String {
        return "\(suit.description), \(rank.description)"
    }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        var description: String {
            return self.rawValue
        }
        
        case clubs = "♣"
        case diamonds = "⬥"
        case hearts = "♥"
        case spades = "♠"
        
        static var all = [Suit.clubs, Suit.diamonds, Suit.hearts, Suit.spades]
    }
    
    enum Rank: CustomStringConvertible {
        var description: String {
            if let ord = order {
                return "\(ord)"
            } else {
                return "cannot get description"
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int? {
            switch self {
            case .ace: return 1
            case .face(let kinds) where kinds == "J": return 11
            case .face(let kinds) where kinds == "Q": return 12
            case .face(let kinds) where kinds == "K": return 13
            case .numeric(let pips): return pips
            default: return nil
            }
        }
        
        static var all: [Rank] {
            var allRank = [Rank.ace]
            for pips in 2...10 {
                allRank.append(PlayingCard.Rank.numeric(pips))
            }
            allRank += [PlayingCard.Rank.face("J"), .face("Q"), .face("K")]
            return allRank
        }
    }
}
