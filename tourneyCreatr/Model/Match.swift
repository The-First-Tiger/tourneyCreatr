//
//  Match.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 29.12.21.
//

import Foundation

class Match: ObservableObject {
    var id = UUID()
    var pairs: [Pair]
    @Published var matchRecorded: Bool = false
    @Published var matchWinner: Int = 0
    
    init(pairs: [Pair]) {
        self.pairs = pairs
    }
    
    func recordWinner(winner: Int) {
        if winner == 1 {
            matchWinner = 1
        } else if winner == 2 {
            matchWinner = 2
        }
        matchRecorded = true
    }
}
