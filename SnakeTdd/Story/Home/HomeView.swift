//
//  HomeView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Combine
import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator = HomeCoordinator()
    
    var body: some View {
        ZStack {
            switch coordinator.currentScreen {
            case .game:
                GameView()
                    .environmentObject(coordinator)
            case .none:
                homeView
            }
        }
    }

    private var homeView: some View {
        ZStack {
            Color(R.color.commonBackground.name)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 20) {
                Text("Snake").font(Font.system(size: 35, weight: .semibold, design: Font.Design.rounded)).multilineTextAlignment(.center)

                Spacer().frame(height: 30)

                Button {
                    coordinator.currentScreen = .game
                } label: {
                    Text("Start Game")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(R.color.commonButtonBackground.name))
                        .foregroundColor(Color(R.color.commonButtonText.name))
                        .cornerRadius(30)

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
