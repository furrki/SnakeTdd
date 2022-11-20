//
//  TableState.swift
//  SnakeTdd
//
//  Created by furrki on 19.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Foundation

struct TableState: Codable {
    let snake: Snake
    let areaSize: CGSize
    let feedPosition: CGPoint
}
