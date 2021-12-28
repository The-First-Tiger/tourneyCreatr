//
//  PlayerViewModel.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import Foundation
import Combine
import RealmSwift

final class PlayerViewModel: ObservableObject {
    
    @Published var players: [Player] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {
        do {
            let realm = try Realm()
            let results = realm.objects(PlayerRealm.self)
            
            token = results.observe( { [weak self] changes in
                
                self?.players = results.map(Player.init)
                    .sorted(by: { $0.vorname > $1.nachname })
                
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func addPlayer(vorname: String, nachname: String) {
        let playerRealm = PlayerRealm(value: [
            "vorname": vorname,
            "nachname": nachname
        ])
        
        do {
            let realm = try Realm()
            try realm.write({
                realm.add(playerRealm)
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
