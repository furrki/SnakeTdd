//
//  GameView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct GameView: View {
    var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                Color.init(red: 41.0 / 255.0, green: 128.0 / 255.0, blue: 185.0 / 255.0)
                    .edgesIgnoringSafeArea(.all)
                
                
            }
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            .navigationBarTitle("Snake", displayMode: .inline)
            .navigationBarHidden(true)
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
