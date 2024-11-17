//
//  ContentView.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 13/11/2024.
//

import SwiftUI

struct ContentView: View {

    @State var amount: Double = 50
    @State var fromCurrency: Currency = .eur
    @State var toCurrency: Currency = .pln
    @State var result: Double = 1

    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack(spacing: 24) {
                // Heading
                HeadingView()
                    .foregroundStyle(.white)

                // Converter
                VStack(spacing: 20) {
                    // From currency
                    CurrencyActionHeaderView(rate: 4.24, label: "Amount")
                    CurrencyActionView(fromCurrency: $fromCurrency, amount: $amount)

                    // Devider & Reverse button
                    ZStack {
                        Divider()
                            .background(.cyan)
                            .frame(height: 4)
                            .cornerRadius(4)

                        Button {

                        } label: {
                            Image(
                                systemName:
                                    "arrow.trianglehead.2.clockwise.rotate.90"
                            )
                            .font(.title2)
                        }
                        .frame(width: 50, height: 50)
                        .background(.cyan)
                        .foregroundStyle(.white)
                        .cornerRadius(50)
                    }

                    // To currency convertion result
                    CurrencyActionHeaderView(rate: 4.24, label: "Converted Amount")
                    CurrencyActionView(fromCurrency: $toCurrency, amount: $result)
                    

                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.white)
                .cornerRadius(20)

                // Numeric keyboard
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ContentView()
}


