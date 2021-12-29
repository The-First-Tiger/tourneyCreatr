//
//  PairRowView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import SwiftUI

struct PairRowView: View {
    
    let pair: Pair
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(pair.player1.vorname + " " + pair.player1.nachname)
            
            Text(pair.player2.vorname + " " + pair.player2.nachname)
        }
        .padding()
    }
}

struct PairRowView_Previews: PreviewProvider {
    static var previews: some View {
        PairRowView(pair: mockPair)
    }
}
