//
//  CurrencyActionView.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 17/11/2024.
//

import SwiftUI

struct CurrencyActionView: View {
    
    @Binding var fromCurrency: Currency
    @Binding var amount: Double
    
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
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background(Color.cyan.opacity(0.1))
                .cornerRadius(10)
            }
            Spacer()
            Text("50.00") // let amount: String
                .font(.title)
                .foregroundStyle(.cyan)
        }
    }
}


#Preview {
    CurrencyActionView(fromCurrency: .constant(.eur), amount: .constant(50.00))
}

