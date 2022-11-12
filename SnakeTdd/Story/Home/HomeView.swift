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
    @State private var isShowingSettings  = false
    
    var body: some View {
        ZStack {
            Color(R.color.commonBackground.name)
                .ignoresSafeArea(.all)

            switch coordinator.currentScreen {
            case .game:
                GameView(speed: .normal)
                    .environmentObject(coordinator)
                    .transition(.move(edge: .top))
            case .none:
                homeView
            }
        }
    }

    private var homeView: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Spacer()

                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(R.color.commonButtonText.name))
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 20)

                Spacer()

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

                Spacer()
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
