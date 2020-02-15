//
//  Game.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import CoreGraphics

class Game {
    private(set) var speed: Int
    private(set) var areaSize: CGSize
    
    init(speed: Int, areaSize: CGSize) {
        self.speed = speed
        self.areaSize = areaSize
    }
}
