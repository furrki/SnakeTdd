//
//  CellView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var cellType: CellType
    let cellSize: CGSize
    
    init(cellType: CellType, cellSize: CGSize = .init(width: 20, height: 20)) {
        self.cellType = cellType
        self.cellSize = cellSize
    }
    
    var body: some View {
        Rectangle()
            .fixedSize()
            .frame(width: cellSize.width, height: cellSize.height, alignment: .center)
            .background(self.cellType.getColor())
            .foregroundColor(self.cellType.getColor())
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 0) {
            CellView(cellType: .snake)
            CellView(cellType: .snakeHead)
            CellView(cellType: .empty)
            CellView(cellType: .feed)
        }
    }
}
