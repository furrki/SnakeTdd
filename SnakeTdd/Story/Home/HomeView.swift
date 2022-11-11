//
//  HomeView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Combine
import SwiftUI
import UIKit

struct HomeView: View {
    @ObservedObject var coordinator = HomeCoordinator()
    
    var body: some View {
        ZStack {
            Image(R.image.grass.name)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .edgesIgnoringSafeArea(.all)

            switch coordinator.currentScreen {
            case .game:
                GameView()
                    .environmentObject(coordinator)
                    .transition(.move(edge: .top))
            case .none:
                homeView
            }
        }
    }

    private var homeView: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Snake")
                    .font(Font.system(size: 35, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color(R.color.commonTitle.name))
                    .multilineTextAlignment(.center)

                Button("Start Game") {
                    withAnimation {
                        coordinator.currentScreen = .game
                    }
                }
                .buttonStyle(MenuButton())
                .font(.system(size: 15, weight: .semibold))
                .padding(.top, 30)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
