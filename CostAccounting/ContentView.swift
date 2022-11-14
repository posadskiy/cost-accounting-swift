//
//  ContentView.swift
//  CostAccounting
//
//  Created by Dmitrii on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Cost Accounting")
                .font(.title)
            HStack {
                Text("Track, analyze and improve your spendings")
                    .font(.subheadline)
                Spacer()
                Text("v0.5.0")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
