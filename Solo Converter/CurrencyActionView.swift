//
//  CurrencyActionView.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 17/11/2024.
//

import SwiftUI

struct CurrencyActionView: View {

    @Binding var fromCurrency: Currency
    @Binding var amount: String

    var body: some View {
        HStack {
            Menu {
                ForEach(Currency.allCases) { currency in
                    Button(action: {
                        fromCurrency = currency
                    }) {
                        HStack {
                            Image(currency.image)
                            Text(currency.name)
                        }

                    }
                }
            } label: {
                HStack {
                    Image(fromCurrency.image)  // Display the currency flag image
                        .foregroundColor(.cyan)
                    Text(fromCurrency.name)  // Display the selected currency name
                        .font(.headline)
                        .lineLimit(1)  // Ensure text is on one line
                        .minimumScaleFactor(0.7)  // Scale down if needed
                        .fixedSize(horizontal: true, vertical: false)  // Prevent text from being cut off
                        .layoutPriority(1)  // Give higher priority to prevent truncation
                    Image(systemName: "chevron.down")
                }
                .padding(10)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(10)
            }
            Spacer()
            Text(amount)  // let amount: String
                .font(.title)
                .foregroundStyle(.cyan)
        }
    }
}

//#Preview {
//    CurrencyActionView(
//        fromCurrency: .constant(.eur), amount: .constant("50.00"))
//}
