//
//  ContentView.swift
//  CostAccounting
//
//  Created by Dmitrii on 14.11.2022.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            ApplicationImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Cost Accounting")
                    .font(.title)
                HStack {
                    Text("Track, analyze and improve your spendings")
                    Spacer()
                    Text("v0.0.1")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Developed carefully Slovenia")
                    .font(.title2)
                Text("Perhaps, the most picturesque country in the world")
                    .font(.subheadline)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
