//
//  CharacterViewController.swift
//  Click
//
//  Created by Louis Tsui on 21/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    // character icon
    @IBOutlet weak var momoIcon : UIButton!
    @IBOutlet weak var soraIcon : UIButton!
    @IBOutlet weak var shiinaIcon : UIButton!
    
    @IBOutlet weak var text: UILabel!
    
    
    var iconNameText = ""
    
//    enum Character {
//        case momoIcon
//        case soraIcon
//        case shiinaIcon
//
//        init?(state: Int) {
//            switch state {
//            case 1: self = .momoIcon
//            case 2: self = .soraIcon
//            case 3: self = .shiinaIcon
//            default : return nil
//            }
//        }
//    }


    override func viewDidLoad() {
        super.viewDidLoad()

        text.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func iconTapDetected(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            iconNameText = "momo"
        case 1:
            iconNameText = "sora"
        case 2:
            iconNameText = "shiina"
        default:
            return
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameVC",
            let gameVC = segue.destination as? GameViewController {
            
            gameVC.momoImage = self.iconNameText
        }
        
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
