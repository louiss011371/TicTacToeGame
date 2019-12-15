//
//  ViewController.swift
//  Click
//
//  Created by Louis Tsui on 15/11/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//
import Foundation
import UIKit

enum PlayerTurn: String {
    case primary
    case secondary
    
    init?(state: Int){
        switch state {
        case 1 : self = .primary
        case 2 : self = .secondary
        default: return nil
        }
    }
    
}


class ViewController: UIViewController {
    
    @IBOutlet var image: [UIButton]!

    var gameSize =  [[0,1,2],
                     [3,4,5],
                     [6,7,8]]

    
    var stepCount = 0
    var playerTurn :PlayerTurn = .primary
 
    @IBAction func tapDetected(_ sender: UIButton) {
     
        switch playerTurn {
        case .primary:
            stepCount += 1
            print("player primary clicked button number = \(sender.tag)")
            print("now step count = \(stepCount)")
            updateOorX(button: sender, forPlayer: PlayerTurn.primary.rawValue)
            playerTurn = .secondary
    
            break
        case .secondary:
            stepCount += 1
             print("player secondary clicked button number = \(sender.tag)")
             print("now step count = \(stepCount)")
             updateOorX(button: sender, forPlayer: PlayerTurn.secondary.rawValue)
             playerTurn = .primary
             break
        default:
          break
        }
        if stepCount >= 9 {
            print("draw")
        }
        
    }
    


    // i am back. XD
    override func viewDidLoad() {
        super.viewDidLoad()
        


//         print("\(gameSize[0][0])")
//         print("\(gameSize[0][1])")
//         print("\(gameSize[0][2])")
//         print("\(gameSize[1][0])")
//         print("\(gameSize[1][1])")
//         print("\(gameSize[1][2])")
//         print("\(gameSize[2][0])")
//         print("\(gameSize[2][1])")
//         print("\(gameSize[2][2])")
    

        //Action
       
        
  
    // 0 1 2
    // 3 4 5
    // 6 7 8
 
      
    }
    private func updateOorX(button: UIButton, forPlayer player: String) {
        if player == PlayerTurn.primary.rawValue {
            button.setImage(UIImage(named: "circle"), for: .normal)
        } else {
            button.setImage(UIImage(named: "cross"), for: .normal)
        }
    }
    
}
