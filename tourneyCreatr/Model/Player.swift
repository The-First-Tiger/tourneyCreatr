//
//  Player.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import Foundation
import RealmSwift

struct Player: Identifiable {
    var id: String
    var vorname: String
    var nachname: String
    var strength: Int = 1
    var wins: Int = 0
    
    init(playerRealm: PlayerRealm) {
        self.id = playerRealm.id.stringValue
        self.vorname = playerRealm.vorname
        self.nachname = playerRealm.nachname
        self.strength = playerRealm.strength
        self.wins = playerRealm.wins
    }
}

let mockPlayer = Player(playerRealm: PlayerRealm(value: ["vorname": "Max", ["nachname"]: "Mustermann"]))
let wildCardPlayer = Player(playerRealm: PlayerRealm(value: ["vorname": "FREI", ["nachname"]: ""]))
