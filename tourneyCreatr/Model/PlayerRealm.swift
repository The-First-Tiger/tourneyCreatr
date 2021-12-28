//
//  PlayerRealm.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import Foundation
import RealmSwift

class PlayerRealm: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var vorname: String
    @Persisted var nachname: String
    @Persisted var strength: Int = 1
    @Persisted var wins: Int = 0
}
