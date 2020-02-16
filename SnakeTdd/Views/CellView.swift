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
        self.cellType.getColor()
            .fixedSize()
            .frame(width: 10, height: 10, alignment: .center)
    }
}
