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
    
    init(cellType: CellType) {
        self.cellType = cellType
    }
    
    var body: some View {
        Rectangle()
            .fixedSize()
            .frame(width: 20, height: 20, alignment: .center)
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
