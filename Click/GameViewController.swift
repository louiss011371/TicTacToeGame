//
//  ViewController.swift
//  Click
//
//  Created by Louis Tsui on 15/11/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//
import Foundation
import UIKit
import QuartzCore


class GameViewController: UIViewController{
    var receiveredCharacter : CharacterViewController?
    
    @IBOutlet weak var playerNameText: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet var winnerImage: UIImageView!
    
    @IBOutlet var oxImage: [UIButton]!
    var board = GameMap()
    var stepCount = 0
    var playerTurn :PlayerTurn = .player
   
    // player, boss , draw game image
    var playerImage = ""
    var bossImage = "pandagoro"
    var drawImage = "draw"
    
    @IBAction func tapDetected(_ sender: UIButton) {
        // check any button is clicked before next turn
        clickDetected(sender)
        
        switch playerTurn {
        case .player:
            stepCount += 1
            updateOorX(oxButton: sender, forPlayer: PlayerTurn.player)
            print(board.self)
            playerTurn = .boss
        case .boss:
            stepCount += 1
            updateOorX(oxButton: sender, forPlayer: PlayerTurn.boss)
            print(board.self)
            playerTurn = .player
        default:
            break
        }
        
        if let results = winRule() {
            winnerImage.isHidden = false
            if results == "O" {
                winnerLabel.isHidden = false
                print("winner is O")
                winnerImage.image = UIImage(named: playerImage)
                continuesClickDetected(false)
            }else if results == "X"{
                winnerLabel.isHidden = false
                print("winner is X")
                winnerImage.image = UIImage(named: bossImage)
                continuesClickDetected(false)
            }else if results == "🔺" && stepCount == 9  {
                winnerImage.image = UIImage(named: drawImage)
                  print("draw")
            }else{
                return
            }
        }
        
    }
    // i am back. XD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameText.text = ""
        winnerImage.isHidden = true
        winnerImage.image = nil
        winnerLabel.isHidden = true
        
//        winnerImage.layer.cornerRadius = 0.8 * winnerImage.bounds.size.width
        
        for oxImage in oxImage {
            oxImage.setImage(nil, for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print(playerImage)
        playerNameText.text = playerImage
    }
    
    private func updateOorX(oxButton: UIButton, forPlayer player: PlayerTurn) {
        var chickedPerson: String
        
        switch player {
        case .player:
            chickedPerson = "O"
            oxButton.setImage(UIImage(named: "\(playerImage)"), for: .normal)
        case .boss:
            chickedPerson = "X"
            oxButton.setImage(UIImage(named: "\(bossImage)"), for: .normal)
        }

            switch oxButton.tag {
            case 0:
                board[0,0] = chickedPerson
            case 1:
                board[0,1] = chickedPerson
            case 2:
                board[0,2] = chickedPerson
            case 3:
                board[1,0] = chickedPerson
            case 4:
                board[1,1] = chickedPerson
            case 5:
                board[1,2] = chickedPerson
            case 6:
                board[2,0] = chickedPerson
            case 7:
                board[2,1] = chickedPerson
            case 8:
                board[2,2] = chickedPerson
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
           for button in oxImage {
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
