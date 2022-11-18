//
//  ApplicationImage.swift
//  CostAccounting
//
//  Created by Dmitrii on 14.11.2022.
//

import SwiftUI

struct ApplicationImage: View {
    var body: some View {
        Image("application-icon")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct ApplicationImage_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationImage()
    }
}
