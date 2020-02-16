//
//  HomeView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(red: 41.0 / 255.0, green: 128.0 / 255.0, blue: 185.0 / 255.0).edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 20) {
                    Spacer().frame(height: -80)
                    Text("Snake").font(Font.system(size: 35, weight: .semibold, design: Font.Design.rounded)).multilineTextAlignment(.center)
                    Spacer().frame(height: 30)
                    NavigationLink(destination: GameView()) {
                        Text("Start Game")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.init(red: 241.0 / 255.0, green: 196.0 / 255.0, blue: 15 / 255.0))
                            .foregroundColor(Color.init(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0))
                            .cornerRadius(30)
                        
                    }
                }
                
            }
                
                
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            .navigationBarTitle(Text(""), displayMode: .inline)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
