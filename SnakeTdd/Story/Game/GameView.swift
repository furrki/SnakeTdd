//
//  GameView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct GameView: View {
    // MARK: - Constants
    private enum Constants {
        static let swipeThreshold = 60.0
        static let fps = 5.0
        static let startDelay = 0.6
    }

    // MARK: - Properties
    @ObservedObject var viewModel: GameViewModel = GameViewModel()
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    private var settingsManager = DependencyManager.storageManager.settingsManager


    var gameTimer: Timer.TimerPublisher

    init(speed: GameSpeed) {
        gameTimer = Timer.publish(every: 1.0 / speed.rawValue,
                                  on: .main,
                                  in: .common)
    }

    // MARK: - Body
    private var headerView: some View {
        HStack(alignment: .center, spacing: 15) {
            BackButton {
                homeCoordinator.popBack()
            }

            Spacer()
        }
        .padding(.horizontal, 30)
    }

    var body: some View {
        VStack {
            headerView
                .padding(.top, 10)

            VStack(alignment: .center, spacing: 0) {
                ForEach(0..<Int(self.viewModel.game.areaSize.height), id: \.self) { j in
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(0..<Int(self.viewModel.game.areaSize.width), id: \.self) { i in
                            CellView(cellType: self.viewModel.getCellType(i, j))
                        }
                    }
                }
            }
//            .animation(.linear(duration: 0.2),
//                       value: viewModel.game.snake.headPos)
            .padding(5)
            .padding(.top, 20)
            .cornerRadius(6.0)

            if !settingsManager.isUsingButtons {
                PhoneButtonsView { number in
                    viewModel.swipeByButton(number: number)
                }
                .padding(.top, 40)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.startDelay) {
                let _ = gameTimer.connect()
            }
        }
        .gesture(DragGesture().onEnded { (value) in
            let _ = self.swiped(value.translation)
        })
        .onReceive(viewModel.objectWillChange) { _ in

        }
        .onReceive(gameTimer) { input in
            viewModel.update()
        }
    }

    // MARK: - Methods
    func swiped(_ value: CGSize) -> MoveDirection? {
        if abs(value.width) > abs(value.height) {
            // Horizontal
            if abs(value.width) >= Constants.swipeThreshold {
                if value.width > 0 {
                    viewModel.swipe(.right)
                    return .right
                } else {
                    viewModel.swipe(.left)
                    return .left
                }
            }
        } else {
            // Vertical
            if abs(value.height) >= Constants.swipeThreshold {
                if value.height > 0 {
                    viewModel.swipe(.down)
                    return .down
                } else {
                    viewModel.swipe(.up)
                    return .up
                }
            }
        }
        return nil
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
            GameView(speed: .fast)
        }
    }
}
