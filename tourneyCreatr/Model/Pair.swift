//
//  Pair.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import Foundation

struct Pair: Identifiable {
    var id = UUID()
    var player1: Player
    var player2: Player
}

let mockPair = Pair(player1: mockPlayer, player2: mockPlayer)
