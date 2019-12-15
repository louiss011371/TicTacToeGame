//
//  gameMap.swift
//  Click
//
//  Created by Louis Tsui on 15/12/2019.
//  Copyright © 2019 Louis Tsui. All rights reserved.
//

import UIKit

class GameMap: NSObject {

    var row : Int
    var column : Int
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
}

