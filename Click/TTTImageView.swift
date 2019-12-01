//
//  TTTImageView.swift
//  Click
//
//  Created by Louis Tsui on 16/11/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

class TTTImageView: UIImageView {
    
    var player: String?
    var activated:Bool! = false
    
    func setPlayer(_player: String) {
        self.player = _player
        
        if activated == false {
            if _player == "x"{
                self.image = UIImage(named: "x")
            }else{
                self.image = UIImage(named: "o")
            }
            activated = true
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
