//
//  Game.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import CoreGraphics

class Game {
    private(set) var areaSize: CGSize
    private(set) var score: Int = 0
    
    init(areaSize: CGSize) {
        self.areaSize = areaSize
    }
}
