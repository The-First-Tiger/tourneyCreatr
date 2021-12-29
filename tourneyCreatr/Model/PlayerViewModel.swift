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
    
    @Published var pairs: [Pair] = []
    
    @Published var players: [Player] = []
    @Published var matches: [Match] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    // MARK: - SPIELER
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
    
    func deletePlayer(id: String) {
        do {
            let realm = try Realm()
            let playerId = try ObjectId(string: id)
            if let player = realm.object(ofType: PlayerRealm.self, forPrimaryKey: playerId) {
                try realm.write({
                    realm.delete(player)
                })
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - PAARE
    private func makePairs() {
        var playersShuffled = self.players.shuffled()
        var pairs = [Pair]()
        
        if (playersShuffled.count % 2 != 0) {
            let wildCard = wildCardPlayer
            playersShuffled.append(wildCard)
        }
        
        for i in stride(from: 0, through: playersShuffled.count-1, by: 2) {
            let newPair = Pair(player1: playersShuffled[i], player2: playersShuffled[i+1])
            pairs.append(newPair)
        }
        
        self.pairs = pairs
    }
    
    
    // MARK: - MATCHES
    private func createMatches() {
        var matches = [Match]()
        
        for i in stride(from: 0, through: pairs.count-1, by: 2) {
            var match = Match(pairs: [Pair]())
            if i < pairs.count-1 {
                match = Match(pairs: [self.pairs[i], self.pairs[i+1]])
            } else {
                match = Match(pairs: [self.pairs[i], Pair(player1: wildCardPlayer, player2: wildCardPlayer)])
            }
            matches.append(match)
        }
        
        self.matches = matches
    }
    
    
    // MARK: - AUSLOSUNG
    func makeDraw() {
        makePairs()
        createMatches()
    }
}
