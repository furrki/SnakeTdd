//
//  Snake.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import CoreGraphics

class Snake {
    private(set) var headPos: CGPoint
    private(set) var direction: MoveDirection
    private(set) var tail: [CGPoint] = []
    
    init(headPos: CGPoint, direction: MoveDirection, initialSize: Int) {
        self.headPos = headPos
        self.direction = direction
        initTail(initialSize: initialSize)
    }
    
     func initTail(initialSize: Int) {
        for i in 1...(initialSize-1) {
            self.tail.append(headPos + direction.getVector() * CGFloat(i))
        }
    }
}
