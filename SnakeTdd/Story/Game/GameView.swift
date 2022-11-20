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
    @StateObject var viewModel: GameViewModel = GameViewModel()
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    private var settingsManager = DependencyManager.storageManager.settingsManager
    private let speed: GameSpeed

    @State var gameTimer: Timer.TimerPublisher

    init(speed: GameSpeed) {
        self.speed = speed
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

            if viewModel.shouldShowReply {
                Button {
                    restart()
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                        .foregroundColor(Color(R.color.commonButtonText.name))
                        .frame(width: 25, height: 25)
                }
            }
        }
    }

    private var tableView: some View {
        GameTableView(cellSize: CGSize(width: 20, height: 20),
                      tableSize: viewModel.game.areaSize) { i, j in
            viewModel.getCellType(i, j)
        }
        .padding(5)
        .cornerRadius(6.0)
        .animation(.linear(duration: 0.1),
                   value: viewModel.game.snake.headPos)
    }

    var body: some View {
        VStack {
            headerView
                .padding(.top, 10)
                .padding(.horizontal, 40)
            Spacer()

            VStack(spacing: 0) {
                HStack {
                    Text("Score: \(viewModel.game.score)")
                        .font(.system(size: 12.0, weight: .semibold))
                        .foregroundColor(Color(R.color.commonTitle.name))
                    Spacer()
                }
                .padding(.horizontal, 40)
                .animation(.none, value: viewModel.game.score)

                ZStack {
                    tableView

                    if viewModel.shouldShowGameOver {
                        GameOverView()
                            .frame(width: self.viewModel.game.areaSize.width * 20,
                                   height: self.viewModel.game.areaSize.height * 20)
                            .opacity(0.9)
                            .transition(.opacity)
                            .onTapGesture {
                                viewModel.gameOverTapped()
                            }
                    }
                }
            }
            .padding(.top, 20)

            if settingsManager.isUsingButtons {
                PhoneButtonsView { number in
                    viewModel.swipeByButton(number: number)
                }
                .padding(.top, 40)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.startDelay) {
                let _ = gameTimer.connect()
            }
        }
        .gesture(DragGesture().onEnded { (value) in
            swiped(value.translation)
        })
        .onReceive(gameTimer) { input in
            guard viewModel.game.state != .crash else {
                gameTimer.connect().cancel()
                return
            }
            withAnimation {
                viewModel.update()
            }
        }
    }

    // MARK: - Methods
    @discardableResult
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

    private func restart() {
        viewModel.restart()
        gameTimer = Timer.publish(every: 1.0 / speed.rawValue,
                                  on: .main,
                                  in: .common)
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.startDelay) {
            gameTimer.connect()
        }
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
