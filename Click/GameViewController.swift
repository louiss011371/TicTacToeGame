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
    @IBOutlet weak var reStartGameBtn: UIBarButtonItem!
    
    @IBOutlet var oxImage: [UIButton]!
    var board = GameMap()
    var stepCount = 0
    var playerTurn :PlayerTurn = .player
   
    @IBOutlet weak var backToCharacter: UINavigationItem!
    // player, boss , draw game image
    var playerImage = ""
    var bossImage = "momoimage"
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
            winnerLabel.isHidden = false
            continuesClickDetected(false)
            reStartGameBtn.isEnabled = true
            if results == "O" {
                print("winner is O")
                winnerImage.image = UIImage(named: playerImage)
            }else if results == "X" {
                print("winner is X")
                winnerImage.image = UIImage(named: bossImage)
            }else if results == "🔺" {
                print("draw")
                winnerImage.image = UIImage(named: drawImage)
            }else{
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameText.text = ""
        winnerImage.isHidden = true
        winnerImage.image = nil
        winnerLabel.isHidden = true
        applyRoundCorder(winnerImage)
        reStartGameBtn.isEnabled = false
        
        for oxImage in oxImage {
            oxImage.setImage(nil, for: .normal)
            applyRoundCorder(oxImage)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print(playerImage)
        if playerImage.contains("momo"){
             playerNameText.text = "momo"
        }else if playerImage.contains("sora") {
             playerNameText.text = "sora"
        }else if playerImage.contains("shiina"){
             playerNameText.text = "shiina"
        }else {
            return
        }
    }
    
    // update O X icon
    private func updateOorX(oxButton: UIButton, forPlayer player: PlayerTurn) {
        var whoClicked: String
        
        switch player {
        case .player:
            whoClicked = "O"
            oxButton.setImage(UIImage(named: "\(playerImage)"), for: .normal)
        case .boss:
            whoClicked = "X"
            oxButton.setImage(UIImage(named: "\(bossImage)"), for: .normal)
        }

            switch oxButton.tag {
            case 0:
                board[0,0] = whoClicked
            case 1:
                board[0,1] = whoClicked
            case 2:
                board[0,2] = whoClicked
            case 3:
                board[1,0] = whoClicked
            case 4:
                board[1,1] = whoClicked
            case 5:
                board[1,2] = whoClicked
            case 6:
                board[2,0] = whoClicked
            case 7:
                board[2,1] = whoClicked
            case 8:
                board[2,2] = whoClicked
            default:
                return
            }
    }
    
    // rule
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
    // detect game over or not
    func continuesClickDetected(_ enable: Bool) {
           for button in oxImage {
               button.isUserInteractionEnabled = enable
           }
       }
    // detect any button is clicked
    func clickDetected(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isUserInteractionEnabled = false
        }
    }
    // set circular button method
    func applyRoundCorder(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.width / 2
        object.layer.masksToBounds = true
    }
    
    @IBAction func reStartGame(_ sender: UIBarButtonItem) {
        self.reStartGame()
    }
    
    func reStartGame() {
        stepCount = 0
        winnerImage.isHidden = true
        winnerImage.image = nil
        winnerLabel.isHidden = true
        continuesClickDetected(true)
        reStartGameBtn.isEnabled = false
        
        board.board = [["","",""],["","",""],["","",""]]
        for oxImage in oxImage {
            oxImage.setImage(nil, for: .normal)
        }
    }
}
