//
//  GameTableView.swift
//  SnakeTdd
//
//  Created by furrki on 19.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Combine
import SwiftUI

struct GameTableView: View {
    // MARK: - Properties
    let cellSize: CGSize
    let tableSize: CGSize
    let getCellType: ((_ i: Int, _ j: Int) -> CellType)

    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<Int(tableSize.height), id: \.self) { j in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0..<Int(tableSize.width), id: \.self) { i in
                        CellView(cellType: getCellType(i, j),
                                 cellSize: cellSize)
                    }
                }
            }
        }
    }
}
