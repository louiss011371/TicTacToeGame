//
//  GameMap.swift
//  Click
//
//  Created by Louis Tsui on 20/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

struct GameMap {
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
