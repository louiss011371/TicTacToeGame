//
//  ViewController.swift
//  TicTacToe(WithAI)
//
//  Created by Tanmay Bakshi on 2015-07-14.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class VSBossViewController: UIViewController {
    var receiveredCharacter : CharacterViewController?
     
     @IBOutlet weak var playerNameText: UILabel!
     
     @IBOutlet weak var winnerLabel: UILabel!
     @IBOutlet var winnerImage: UIImageView!
     
//     @IBOutlet var oxImages: [UIButton]!
     var board = GameMap()
     var stepCount = 0
     var playerTurn :PlayerTurn = .player
    
    @IBAction func eight(_ sender: UIButton) {
        print("click")
    }
    
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    
    
     @IBOutlet var oxImages: [UIImageView]!
    
     @IBOutlet weak var backToCharacter: UINavigationItem!
     // player, boss , draw game image
     var playerImage = "soraimage"
     var bossImage = "pandagoro"
     var drawImage = "draw"
     
    
    
    
   
    
  
         // check any button is clicked before next turn
//
//    if let results = winRule() {
//        winnerImage.isHidden = false
//        if results == "O" {
//            winnerLabel.isHidden = false
//            print("winner is O")
//            winnerImage.image = UIImage(named: playerImage)
//            continuesClickDetected(false)
//        }else if results == "X"{
//            winnerLabel.isHidden = false
//            print("winner is X")
//            winnerImage.image = UIImage(named: bossImage)
//            continuesClickDetected(false)
//        }else if results == "🔺" && stepCount == 9  {
//            winnerImage.image = UIImage(named: drawImage)
//            print("draw")
//        }else{
//            return
//        }
//    }
    
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         playerNameText.text = ""
//         winnerImage.isHidden = true
       //  winnerImage.image = nil
         winnerLabel.isHidden = true
        
       
       
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        //image0.isUserInteractionEnabled = true
        //image0.addGestureRecognizer(tapGestureRecognizer)
      for oximage in oxImages {
         let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                 applyRoundCorder(oximage)
                 oximage.isUserInteractionEnabled = true
                 oximage.addGestureRecognizer(tapGestureRecognizer)
             }
         
//         applyRoundCorder(winnerImage)

//         for oxImage in oxImages {
//             oxImage.setImage(nil, for: .normal)
//             applyRoundCorder(oxImage)
//         }
     }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("tapped")
        tappedImage.image = UIImage(named: "soraimage")
        print("sora")

        
//        for oximage in oxImages {
//            imageViewClickable(oximage, tap: tapGestureRecognizer)
//            print("click okokok")
//        }
        // Your action
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
//     private func updateOorX(oxButton: UIButton, forPlayer player: PlayerTurn) {
//         var whoClicked: String
//        var bossClicked : Bool = false
//        switch oxButton.tag {
//        case 0:
//            button1.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 1:
//            button2.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 2:
//            button3.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 3:
//            button4.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 4:
//            button5.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 5:
//            button6.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 6:
//            button7.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 7:
//            button8.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        case 8:
//            button0.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//            break
//        default:
//            return
//        }
//         var bossClicked : Bool = false
//         if board[0,1] == "O" {
//                board[0,0] = "X"
//            button0.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//                  print(" board[0,1] = X print from boss \(board.self)")
//            playerTurn = .player
//            }else{
//                board[0,1] = "X"
//             button1.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//                 print(" board[0,0] = X print from boss \(board.self)")
//            playerTurn = .player
//            }

//    switch player {
//    case .player:
//    whoClicked = "O"
//    oxButton.setImage(UIImage(named: "\(playerImage)"), for: .normal)
//    case .boss:
//    whoClicked = "X"
//    oxButton.setImage(UIImage(named: "\(bossImage)"), for: .normal)
//    }
//
//
//
//
//    switch oxButton.tag {
//    case 0:
//    board[0,0] = whoClicked
//    case 1:
//    board[0,1] = whoClicked
//    case 2:
//    board[0,2] = whoClicked
//    case 3:
//    board[1,0] = whoClicked
//    case 4:
//    board[1,1] = whoClicked
//    case 5:
//    board[1,2] = whoClicked
//    case 6:
//    board[2,0] = whoClicked
//    case 7:
//    board[2,1] = whoClicked
//    case 8:
//    board[2,2] = whoClicked
//    default:
//    return
//    }
//}

     // rule
//     func winRule() -> String? {
//         var result : String? = nil
//
//         if stepCount == 9  {
//             result = "🔺"
//         }
//         // 0,1,2
//         if board[0,0] != "" && board[0,0] == board[0,1] && board[0,1] == board[0,2] {
//             result = board[0,0]
//         // 3,4,5
//         }
//         if board[1,0] != "" && board[1,0] == board[1,1] && board[1,1] == board[1,2] {
//            result = board[1,0]
//         // 6,7,8
//         }
//         if board[2,0] != "" && board[2,0] == board[2,1] && board[2,1] == board[2,2] {
//             result = board[2,0]
//         // 0,3,6
//         }
//         if board[0,0] != "" && board[0,0] == board[1,0] && board[1,0] == board[2,0] {
//            result = board[0,0]
//         // 1,4,7
//         }
//         if board[0,1] != "" && board[0,1] == board[1,1] && board[1,1] == board[2,1] {
//            result = board[0,1]
//         // 2,5,8
//         }
//         if board[0,2] != "" && board[0,2] == board[1,2] && board[1,2] == board[2,2] {
//            result = board[0,2]
//         }
//         // 0,4,8
//         if board[0,0] != "" && board[0,0] == board[1,1] && board[1,1] == board[2,2] {
//            result = board[0,0]
//         }
//          // 2,4,6
//         if board[0,2] != "" && board[0,2] == board[1,1] && board[1,1] == board[2,0] {
//            result = board[0,2]
//         }
//
//         return result
//     }
     // detect game over or not
     func continuesClickDetected(_ enable: Bool) {
            for button in oxImages {
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
    
    func imageViewClickable(_ object: UIImageView, tap: UITapGestureRecognizer) {
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tap)
    }
}
