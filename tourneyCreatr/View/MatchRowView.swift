//
//  MatchRowView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 29.12.21.
//

import SwiftUI

struct MatchRowView: View {
    
    var match: Match
    
    var body: some View {
        HStack {
            PairRowView(pair: match.pairs[0])
            
            PairRowView(pair: match.pairs[1])
        }
    }
}

/*struct MatchRowView_Previews: PreviewProvider {
    static var previews: some View {
        MatchRowView()
    }
}*/
