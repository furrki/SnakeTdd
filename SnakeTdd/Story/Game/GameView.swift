//
//  GameView.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel = GameViewModel()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
    let SWIPE_TRESHOLD: CGFloat = 70.0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                Color(R.color.commonBackground.name)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer().frame(height: 20)
                    
                    VStack(alignment: .center, spacing: 0) {
                        ForEach(0..<Int(self.viewModel.game.areaSize.height), id: \.self) { j in
                            HStack(alignment: .center, spacing: 0) {
                                ForEach(0..<Int(self.viewModel.game.areaSize.width), id: \.self) { i in
                                    CellView(cellType: self.viewModel.getCellType(i, j))
                                }
                            }
                        }
                    }
                    .padding(5)
                    .cornerRadius(6.0)
                    
                    Spacer().frame(height: 20)
                }
            }
            .gesture(DragGesture().onEnded { (value) in
                let _ = self.swiped(value.translation)
            })
            
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            .navigationBarTitle("Snake", displayMode: .inline)
            .navigationBarHidden(true)
            .onAppear {
                self.viewModel.startGame()
        }
            .onReceive(viewModel.objectWillChange) { _ in
            if self.viewModel.game.state == .crash {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    homeCoordinator.popBack()
                })
            }
        }
    }
    
    func swiped(_ value: CGSize) -> MoveDirection? {
        if abs(value.width) > abs(value.height) {
            // Horizontal
            if abs(value.width) >= SWIPE_TRESHOLD {
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
            if abs(value.height) >= SWIPE_TRESHOLD {
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
        GameView()
    }
}
