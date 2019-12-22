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
    @IBOutlet weak var momoImage : UIButton!
    @IBOutlet weak var soraImage : UIButton!
    @IBOutlet weak var shiinaImage : UIButton!
    
    var imageNameText = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func iconTapDetected(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            imageNameText = "momo"
        case 1:
            imageNameText = "sora"
        case 2:
            imageNameText = "shiina"
        default:
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameVC",
            let gameVC = segue.destination as? GameViewController {
            gameVC.playerImage = self.imageNameText
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
