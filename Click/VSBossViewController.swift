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
    
    
    @IBOutlet weak var reStartGameBtn: UIBarButtonItem!
    
    //     @IBOutlet var oxImages: [UIButton]!
    var board = GameMap()
    var stepCount = 0
    var playerTurn :PlayerTurn = .player
    
    var arr = ["X","O"]
    
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
    var playerImage = "soraicon"
    var bossImage = "pandagoro"
    var drawImage = "draw"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get player name text from character page
        playerNameText.text = ""
        // hidden winner label
        winnerLabel.isHidden = true
        // set winner image is nil
        winnerImage.image = nil
        reStartGameBtn.isEnabled = false
        for oximage in oxImages {
            // default all OX image is nil
            oximage.image = nil
            applyRoundCorder(oximage)
            board[1,1] = "X"
            image4.image = UIImage(named: bossImage)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            // set all OX image to circular
            
            // set all OX image clickable and action name (tapGestureRecognizer)
            oximage.isUserInteractionEnabled = true
            oximage.addGestureRecognizer(tapGestureRecognizer)
            
            // updateOX(image: oximage)
        }
        
    }
    // imageView clickable action using objectC
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        
        // if oxImage == nil clickable else unclickable
        guard tappedImage.image == nil else {
            
            imageViewClickable(tappedImage, tap: tapGestureRecognizer)
            return
        }
        
        tappedImage.image = UIImage(named: playerImage)
        print("player sora clicked \(tappedImage.tag)")
        stepCount += 1
        print(stepCount)
        
        switch tappedImage.tag {
        
        case 0 :
            board[0,0] = "O"
            if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            } else if board[1,0] == "X" && board[1,1] == "X" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,2] == "X" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            } else if board[2,0] == "X" && board[1,1] == "X" && board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            } else if board[0,0] == "O" && board[0,1] == "O"  && board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            } else if board[0,0] == "O" && board[0,2] == "O" && board[0,1] != "O"{
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            } else if board[0,0] == "O" && board[1,0] == "O" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            }else if board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            } else if board[0,1] != "O" {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            }
            print(board.self)
        case 1 :
            board[0,1] = "O"
            if board[0,0] == "X" && board[1,1] == "X" && board[2,2] != "O" {
                board[2,2] = "X"
                   image8.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[1,0] == "X" && board[1,2] != "O" {
                board[1,2] = "X"
                   image5.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,2] == "X" && board[2,0] != "O" {
                board[2,0] = "X"
                   image6.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[2,0] == "X" && board[0,2] != "O" {
                board[0,2] = "X"
                    image2.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
                board[1,0] = "X"
                    image3.image = UIImage(named: bossImage)
            }else if board[0,0] == "O" && board[0,1] == "O"  && board[0,2] != "O" {
                board[0,2] = "X"
                   image2.image = UIImage(named: bossImage)
            }else if board[0,1] == "O" && board[0,2] == "O" && board[0,0] != "O"{
                board[0,0] = "X"
                    image0.image = UIImage(named: bossImage)
            }else if board[0,0] != "O" {
                board[0,0] = "X"
                   image0.image = UIImage(named: bossImage)
            }
            print(board.self)
        case 2 :
            board[0,2] = "O"
            // MARK: for test case
            if board[1,1] == "X" && board[2,2] == "X" && board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            } else if board[0,0] == "X" && board[1,1] == "X" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if board[0,2] == "O" && board[2,2] == "O" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            }   else if board[2,1] != "O" {
                board[2,1] = "X"
                image7.image = UIImage(named: bossImage)
                
            } else if board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[1,0] == "X" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            } else if board[0,0] == "O" && board[0,2] == "O"  && board[0,1] != "O" {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            }else if board[0,2] == "O" && board[1,2] == "O" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            } else if board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            }
            print(board.self)
        case 3 :
            board[1,0] = "O"
            if board[1,1] == "X" && board[2,1] == "X" && board[0,1] != "O" {
            board[0,1] = "X"
            image1.image = UIImage(named: bossImage)
        } else if board[0,1] == "X" && board[1,1] == "X" && board[2,1] != "O" {
                board[2,1] = "X"
                image7.image = UIImage(named: bossImage)
            }else if board[1,1] == "X" && board[2,2] == "X" && board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            }else if board[2,1] != "O" {
                board[2,1] = "X"
                image7.image = UIImage(named: bossImage)
            } else if board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            }
                
            else if board[0,0] == "X" && board[1,1] == "X" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            }else if board[1,1] == "X" && board[2,0] == "X" && board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,1] != "O"  {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            }else if board[1,1] == "X" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            }
            print(board.self)
            
        case 4 :
            board[1,1] = "O"
        case 5 :
            board[1,2] = "O"
            
            if board[1,1] == "X" && board[2,1] == "X" && board[0,1] != "O" {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[2,2] == "X" && board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            } else if board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[2,2] == "X" && board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,0] == "X" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            } else if board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            } else if board[0,2] == "O" && board[1,2] == "O" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if  board[0,1] == "X" && board[1,1] == "X" && board[2,1] != "O" {
                board[2,1] = "X"
                image7.image = UIImage(named: bossImage)
            }
        case 6 :
            board[2,0] = "O"
            if board[1,1] == "X" && board[2,1] == "X" && board[0,1] != "O" {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            }else if board[0,2] == "X" && board[1,1] == "X" && board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            }else if board[1,0] == "X" && board[1,1] == "X" && board[2,1] != "O"{
                board[2,1] = "X"
                image7.image = UIImage(named: bossImage)
            } else if board[2,0] == "O" && board[1,0] == "O" &&  board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            } else if board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            } else if board[2,0] == "O" && board[2,1] == "O" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            }else if board[2,0] == "O" && board[1,1] == "O" && board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            }else if board[0,0] == "X" && board[1,1] == "X" && board[2,2] != "O"{
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            }else if board[1,0] == "X" && board[1,1] == "X" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            }else if board[1,1] == "X" && board[2,2] == "X" && board[0,0] != "O"{
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            }
            print(board.self)
        case 7 :
            board[2,1] = "O"
            if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
            board[1,0] = "X"
            image3.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,2] == "X" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            }else if board[2,0] == "O" && board[2,1] == "O" && board[2,2] != "X" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            }
            else if board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            }
            else if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,2] == "X" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,0] == "X" && board[2,2] != "O" {
                board[2,2] = "X"
                image8.image = UIImage(named: bossImage)
            } else if board[1,0] == "X" && board[1,1] == "X" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            } else if board[0,0] != "O" {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            }
            else if board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            }
            
            print(board.self)
        case 8 :
            board[2,2] = "O"
            if board[1,1] == "X" && board[2,1] == "X" && board[0,1] != "O" {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[1,2] == "X" && board[1,0] != "O" {
                board[1,0] = "X"
                image3.image = UIImage(named: bossImage)
            } else if  board[0,0] == "X" && board[0,2] == "X" && board[0,1] != "O" {
                board[0,1] = "X"
                image1.image = UIImage(named: bossImage)
            } else if  board[1,1] == "X" && board[1,0] == "X" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            } else if board[1,1] == "X" && board[0,2] == "X" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            } else if board[2,1] == "O" && board[2,2] == "O" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            } else if board[2,0] == "O" && board[2,2] == "O" && board[2,1] != "O" {
                board[2,1] = "X"
                image7.image = UIImage(named: bossImage)
            } else if board[2,2] == "O" && board[1,2] == "O" && board[0,2] != "O" {
                board[0,2] = "X"
                image2.image = UIImage(named: bossImage)
            }else if board[2,2] == "O" && board[0,2] == "O" && board[1,2] != "O" {
                board[1,2] = "X"
                image5.image = UIImage(named: bossImage)
            }else if board[1,1] == "O" && board[2,2] == "O" && board[0,0] != "O"  {
                board[0,0] = "X"
                image0.image = UIImage(named: bossImage)
            }else if board[0,0] == "O" && board[2,2] == "O" && board[1,1] != "O" {
                board[1,1] = "X"
                image4.image = UIImage(named: bossImage)
            }else if board[2,2] == "O" && board[2,0] != "O" {
                board[2,0] = "X"
                image6.image = UIImage(named: bossImage)
            }
            
            print(board.self)
        default:
            return
        }
        //TODO: AImovement
        
        if let results = winRule() {
            winnerImage.isHidden = false
            winnerLabel.isHidden = false
            continuesClickDetected(false)
            winnerLabel.isHidden = true
            reStartGameBtn.isEnabled = true
            
            if results == "O" {
                winnerLabel.isHidden = false
                print("winner is O")
                winnerImage.image = UIImage(named: playerImage)
                continuesClickDetected(false)
            }else if results == "X"{
                print("winner is X")
                winnerImage.image = UIImage(named: bossImage)
            }else if results == "🔺"  {
                winnerImage.image = UIImage(named: drawImage)
                print("draw")
            }else{
                return
            }
        }
        print(board.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        applyRoundCorder(winnerImage)
        
        print("slected player image is \(playerImage)")
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
    
    // rule
    func winRule() -> String? {
        var result : String? = nil
      
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
    // set all OX image circle once only
    func imageViewClickable(_ object: UIImageView, tap: UITapGestureRecognizer) {
        object.isUserInteractionEnabled = false
        object.addGestureRecognizer(tap)
    }
    
    @IBAction func reStartGame(_ sender: UIBarButtonItem) {
        self.reStartGame()
        board[1,1] = "X"
        image4.image = UIImage(named: bossImage)
    }
    
    func reStartGame() {
        stepCount = 0
        winnerImage.isHidden = true
        winnerImage.image = nil
        winnerLabel.isHidden = true
        continuesClickDetected(true)
        reStartGameBtn.isEnabled = false
    
        
        board.board = [["","",""],["","",""],["","",""]]
        for oxImage in oxImages {
            oxImage.image = nil
        }
    }
    
}
