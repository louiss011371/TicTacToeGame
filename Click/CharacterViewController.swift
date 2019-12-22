//
//  CharacterViewController.swift
//  Click
//
//  Created by Louis Tsui on 21/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    // first line character image
    @IBOutlet weak var shiinaImage : UIButton!
    @IBOutlet weak var momoImage : UIButton!
    @IBOutlet weak var soraImage : UIButton!
    
    // second line character image
    @IBOutlet weak var shiinaIcon: UIButton!
    @IBOutlet weak var momoIcon: UIButton!
    @IBOutlet weak var soraIcon: UIButton!
    
    // game start btn
    @IBOutlet weak var playBtn: UIButton!
    
    // store selected image game for passing to game view
    var imageNameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // play button enable
        playBtn.isEnabled = false
        // set all image into a array list
        let circleImage = [shiinaImage,momoImage,soraImage,
                           shiinaIcon,momoIcon,soraIcon]
        
        // button circular function
        for images in circleImage {
            applyRoundCorder(images!)
        }
    }
    @IBAction func iconTapDetected(_ sender: UIButton) {
        
        playBtn.isEnabled = true
        
        switch sender.self {
        case shiinaImage:
            imageNameText = "shiinaimage"
        case momoImage:
            imageNameText = "momoimage"
        case soraImage:
            imageNameText = "soraimage"
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
    
    // pass imageText when play button is clicked
    @IBAction func playBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "playerName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let gameVC = segue.destination as? GameViewController
        gameVC?.playerImage = self.imageNameText
        
    }
    // set circular button method
    func applyRoundCorder(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.width / 2
        object.layer.masksToBounds = true
    }
}
