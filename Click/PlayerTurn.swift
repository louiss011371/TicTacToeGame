//
//  PlayerData.swift
//  Click
//
//  Created by Louis Tsui on 20/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

enum PlayerTurn {
    case player
    case boss
    
    init?(state: Int){
        switch state {
        case 1 : self = .player
        case 2 : self = .boss
        default: return nil
        }
    }
    
}

