//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Yasiru Jayasekara
//

import UIKit

class ViewController: UIViewController {

    //IBOutlet allows to reference with UI Elements
    @IBOutlet weak var diceImageViewone: UIImageView!
    @IBOutlet weak var diceImageViewtwo: UIImageView!
    
    @IBAction func rollDice(_ sender: Any) {
        //constant variable
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
                
        diceImageViewone.image = diceArray[Int.random(in: 0...5)]
        diceImageViewtwo.image = diceArray[Int.random(in: 0...5)]
                
    }
}

