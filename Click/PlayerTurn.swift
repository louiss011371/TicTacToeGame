//
//  PlayerData.swift
//  Click
//
//  Created by Louis Tsui on 20/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

class PlayerTurn: NSObject {
    
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
}
