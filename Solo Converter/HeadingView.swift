//
//  HeadingView.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 13/11/2024.
//

import SwiftUI

struct HeadingView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Solo Converter")
                .font(.largeTitle)
            Text(
                "Pick a main currency, a target currency, enter an amount, and see the result."
            )
            .font(.body)
        }
        .padding(.horizontal, 20)
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    HeadingView()
}
