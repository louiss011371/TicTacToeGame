//
//  ViewController.swift
//  Click
//
//  Created by Louis Tsui on 15/11/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//
import Foundation
import UIKit


class GameViewController: UIViewController{
    
    @IBOutlet weak var testText: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet var winnerImage: UIImageView!
    
    
   
    
    @IBOutlet var image: [UIButton]!
    var board = GameMap()
    var stepCount = 0
    var playerTurn :PlayerTurn = .primary
    
    var receiveredCharacter : CharacterViewController?
    var  momoImage :String = ""
    
    var  pandaImage: String = "pandagoro"
    
    @IBAction func tapDetected(_ sender: UIButton) {
        // check any button is clicked before next turn
        clickDetected(sender)
        
       // sender.isEnabled = false
        
        switch playerTurn {
        case .primary:
            stepCount += 1
            updateOorX(button: sender, forPlayer: PlayerTurn.primary)
            print(board.self)
            playerTurn = .secondary
        case .secondary:
            stepCount += 1
            updateOorX(button: sender, forPlayer: PlayerTurn.secondary)
            print(board.self)
            playerTurn = .primary
        default:
            break
        }
        
        if let results = winRule() {
            
            winnerLabel.isHidden = false
            winnerImage.isHidden = false
            if results == "O" {
                print("winner is O")
                winnerImage.image = UIImage(named: momoImage)
                continuesClickDetected(false)
            }else if results == "X"{
                  print("winner is X")
                winnerImage.image = UIImage(named: pandaImage)
                continuesClickDetected(false)
            }else if results == "🔺" && stepCount == 9  {
                  print("draw")
            }else{
                return
            }
        }
        
    }
    
    
    // i am back. XD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerImage.isHidden = true
        winnerImage.image = nil
        winnerLabel.isHidden = true
        
        
        
        
        for button in image {
            button.setImage(nil, for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print(momoImage)
        testText.text = momoImage
    }
    
    private func updateOorX(button: UIButton, forPlayer player: PlayerTurn) {
        var who: String
        
        switch player {
        case .primary:
            who = "O"
            button.setImage(UIImage(named: "\(momoImage)"), for: .normal)
        case .secondary:
            who = "X"
            button.setImage(UIImage(named: "\(pandaImage)"), for: .normal)
        }

            switch button.tag {
            case 0:
                board[0,0] = who
            case 1:
                board[0,1] = who
            case 2:
                board[0,2] = who
            case 3:
                board[1,0] = who
            case 4:
                board[1,1] = who
            case 5:
                board[1,2] = who
            case 6:
                board[2,0] = who
            case 7:
                board[2,1] = who
            case 8:
                board[2,2] = who
            default:
                return
            }
    }
    
    func winRule() -> String? {
        var result : String? = nil
        
        if stepCount == 9  {
            result = "🔺"
        }
        // 0,1,2
        if board[0,0] != "" && board[0,0] == board[0,1] && board[0,1] == board[0,2] {
            result = board[0,0]
        // 3,4,5
        }
        if board[1,0] != "" && board[1,0] == board[1,1] && board[1,1] == board[1,2] {
           result = board[1,0]
        // 6,7,8
        }
        if board[2,0] != "" && board[2,0] == board[2,1] && board[2,1] == board[2,2] {
            result = board[2,0]
        // 0,3,6
        }
        if board[0,0] != "" && board[0,0] == board[1,0] && board[1,0] == board[2,0] {
           result = board[0,0]
        // 1,4,7
        }
        if board[0,1] != "" && board[0,1] == board[1,1] && board[1,1] == board[2,1] {
           result = board[0,1]
        // 2,5,8
        }
        if board[0,2] != "" && board[0,2] == board[1,2] && board[1,2] == board[2,2] {
           result = board[0,2]
        }
        // 0,4,8
        if board[0,0] != "" && board[0,0] == board[1,1] && board[1,1] == board[2,2] {
           result = board[0,0]
        }
         // 2,4,6
        if board[0,2] != "" && board[0,2] == board[1,1] && board[1,1] == board[2,0] {
           result = board[0,2]
        }
        
        return result
    }
    
    func continuesClickDetected(_ enable: Bool) {
           for button in image {
               button.isUserInteractionEnabled = enable
           }
       }
    
    func clickDetected(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isUserInteractionEnabled = false
            
        }
    }
    
    // detect selected character
  

}
