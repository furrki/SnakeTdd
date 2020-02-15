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
    private(set) var lastDirection: MoveDirection
    private(set) var tail: [CGPoint] = []
    
    init(headPos: CGPoint, direction: MoveDirection, initialSize: Int) {
        self.headPos = headPos
        self.direction = direction
        self.lastDirection = direction
        initTail(initialSize: initialSize)
    }
    
     func initTail(initialSize: Int) {
        for i in (1...(initialSize-1)).reversed() {
            self.tail.append(headPos + direction.getVector() * CGFloat(i))
        }
    }
    
    func setDirection(_ newDirection: MoveDirection) {
        if newDirection.getVector() + lastDirection.getVector() != CGVector(dx: 0, dy: 0) {
            direction = newDirection
        }
    }
    
    func didMovement() {
        self.headPos = self.headPos + self.direction.getVector()
        self.tail = self.tail.map({ (bodyPart) in
            return bodyPart + self.direction.getVector()
        })
        
        self.lastDirection = self.direction
    }
}
