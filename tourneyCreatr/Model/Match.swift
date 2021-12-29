//
//  Match.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 29.12.21.
//

import Foundation

struct Match: Identifiable {
    var id = UUID()
    var pairs: [Pair]
    var matchRecorded: Bool = false
    var matchWinner: Int = 0
}
