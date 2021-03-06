//
//  CGVector+Extensions.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import CoreGraphics

public extension CGVector {
    static func * (vector: CGVector, scalar: CGFloat) -> CGVector {
      return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static func + (vector: CGVector, vector2: CGVector) -> CGVector {
        return CGVector(dx: vector.dx + vector2.dx, dy: vector.dy + vector2.dy)
    }
}
