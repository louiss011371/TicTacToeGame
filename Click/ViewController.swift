//
//  ViewController.swift
//  Click
//
//  Created by Louis Tsui on 15/11/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//
import Foundation
import UIKit


class ViewController: UIViewController {
    
    
    struct TicTacToe {
        var board = [["","",""],["","",""],["","",""]]
        subscript(x: Int, y: Int) -> String {
            get {
                return board[x][y]
            }
            set {
                board[x][y] = newValue
            }
        }
    }
    
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
    
    @IBOutlet var image: [UIButton]!
    var board = TicTacToe()
    var stepCount = 0
    var playerTurn :PlayerTurn = .primary
    
    
    @IBAction func tapDetected(_ sender: UIButton) {
        // check any button is clicked before next turn
        clickDetected(sender)
        
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
            if results == "O" {
                print("winner is O")
                continuesClickDetected(false)
            }else if results == "X"{
                  print("winner is X")
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
        
        for button in image {
            button.setImage(nil, for: .normal)
        }
    }
    
    private func updateOorX(button: UIButton, forPlayer player: ViewController.PlayerTurn) {
        switch player {
        case .primary:
            break
        case .secondary:
            break
        }
       
        if player == PlayerTurn.primary {
            button.setImage(UIImage(named: "circle"), for: .normal)
            switch button.tag {
            case 0:
                board[0,0] = "O"
//                button.isUserInteractionEnabled = false
            case 1:
                board[0,1] = "O"
//                button.isUserInteractionEnabled = false
            case 2:
                board[0,2] = "O"
//                button.isUserInteractionEnabled = false
            case 3:
                board[1,0] = "O"
//                button.isUserInteractionEnabled = false
            case 4:
                board[1,1] = "O"
//                button.isUserInteractionEnabled = false
            case 5:
                board[1,2] = "O"
//                button.isUserInteractionEnabled = false
            case 6:
                board[2,0] = "O"
//                button.isUserInteractionEnabled = false
            case 7:
                board[2,1] = "O"
//                button.isUserInteractionEnabled = false
            case 8:
                board[2,2] = "O"
//                button.isUserInteractionEnabled = false
            default:
                return
            }
        } else {
            button.setImage(UIImage(named: "cross"), for: .normal)
            switch button.tag {
            case 0:
                board[0,0] = "X"
//                button.isUserInteractionEnabled = false
            case 1:
                board[0,1] = "X"
//                button.isUserInteractionEnabled = false
            case 2:
                board[0,2] = "X"
//                button.isUserInteractionEnabled = false
            case 3:
                board[1,0] = "X"
//                button.isUserInteractionEnabled = false
            case 4:
                board[1,1] = "X"
//                button.isUserInteractionEnabled = false
            case 5:
                board[1,2] = "X"
//                button.isUserInteractionEnabled = false
            case 6:
                board[2,0] = "X"
//                button.isUserInteractionEnabled = false
            case 7:
                board[2,1] = "X"
//                button.isUserInteractionEnabled = false
            case 8:
                board[2,2] = "X"
//                button.isUserInteractionEnabled = false
            default:
                return
            }
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

}
