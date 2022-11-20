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
    @State private var isShowingSettings = false
    @State private var isShowingSelectInput = true
    private let settingsManager = DependencyManager.storageManager.settingsManager
    private let storageManager = DependencyManager.storageManager
    
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

                VStack(spacing: 0) {
                    Text("Snake")
                        .font(Font.system(size: 35, weight: .semibold, design: Font.Design.rounded))
                        .foregroundColor(Color(R.color.commonTitle.name))
                        .multilineTextAlignment(.center)
                    Text("AppGea")
                        .font(Font.system(size: 12, weight: .semibold, design: Font.Design.rounded))
                        .foregroundColor(Color(R.color.commonTitle.name))
                        .multilineTextAlignment(.center)
                }

                Button("Start Game") {
                    withAnimation {
                        coordinator.currentScreen = .game
                    }
                }
                .buttonStyle(MenuButton())
                .font(.system(size: 15, weight: .semibold))
                .padding(.top, 30)

                if let biggestSnake = storageManager.biggestSnake {
                    VStack(spacing: 5) {
                        HStack {
                            Text("Largest Snake: \(storageManager.highScore)")
                                .font(.footnote)
                                .foregroundColor(Color(R.color.commonTitle.name))
                            Spacer()
                        }
                        .frame(width: 160)

                        GameTableView(cellSize: CGSize(width: 10, height: 10), tableSize: CGSize(width: 16, height: 16)) { i, j in
                            if biggestSnake.snake.tail.contains(CGPoint(x: i, y: j)) {
                                return .snake
                            } else if biggestSnake.snake.headPos == CGPoint(x: i, y: j) {
                                return .snakeHead
                            } else if biggestSnake.feedPosition == CGPoint(x: i, y: j) {
                                return .feed
                            } else {
                                return .empty
                            }
                        }
                        .cornerRadius(6)
                        .border(.black.opacity(0.8), width: 3.0)
                        .cornerRadius(6)
                    }
                    .padding(.top, 40)
                }

                Spacer()
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }

            if isShowingSelectInput && !storageManager.hasSetInputType {
                SelectInputView { selection in
                    withAnimation {
                        isShowingSelectInput = false
                    }

                    switch selection {
                    case .buttons:
                        settingsManager.isUsingButtons = true
                    case .swipe:
                        settingsManager.isUsingButtons = false
                    }

                    storageManager.hasSetInputType = true
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 40)
                .background(Color(R.color.gameOverBackgroundCover.name))
                .cornerRadius(5.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
