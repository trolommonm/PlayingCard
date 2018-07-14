//
//  ViewController.swift
//  PlayingCard
//
//  Created by Alvin Tan De Jun on 10/7/18.
//  Copyright © 2018 Alvin Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cards = PlayingCardDeck()
        for _ in 1...10 {
            if let card = cards.draw() {
                print("\(card.description)")
            }
        }
    }
    
}

