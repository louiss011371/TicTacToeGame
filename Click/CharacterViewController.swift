//
//  CharacterViewController.swift
//  Click
//
//  Created by Louis Tsui on 21/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    // character image
    @IBOutlet weak var shiinaImage : UIButton!
    @IBOutlet weak var momoImage : UIButton!
    @IBOutlet weak var soraImage : UIButton!
    
    
    @IBOutlet weak var shiinaIcon: UIButton!
    @IBOutlet weak var momoIcon: UIButton!
    @IBOutlet weak var soraIcon: UIButton!
    
    var imageNameText = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyRoundCorder(shiinaImage)
        applyRoundCorder(momoImage)
        applyRoundCorder(shiinaImage)
        applyRoundCorder(soraIcon)
        applyRoundCorder(soraIcon)
        applyRoundCorder(shiinaIcon)

    }

    @IBAction func iconTapDetected(_ sender: UIButton) {
        switch sender.self {
        case shiinaImage:
            imageNameText = "shiinaimage"
        case momoImage:
            imageNameText = "momoimage"
        case soraImage:
            imageNameText = "soraImage"
        case shiinaIcon:
            imageNameText = "shiinaicon"
        case momoIcon:
            imageNameText = "momoicon"
        case soraIcon:
            imageNameText = "soraicon"
        default:
            return
        }
    }
    @IBAction func goToGameView(_ sender: UIButton) {
       performSegue(withIdentifier: "playerName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let gameVC = segue.destination as? GameViewController
            gameVC?.playerImage = self.imageNameText
        }

       func applyRoundCorder(_ object:AnyObject) {
                object.layer.cornerRadius = object.frame.width / 2
                object.layer.masksToBounds = true
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
