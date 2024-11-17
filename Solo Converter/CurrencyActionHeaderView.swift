//
//  CurrencyActionHeaderView.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 17/11/2024.
//

import SwiftUI

struct CurrencyActionHeaderView: View {
    
    let rate: Double
    let label: String
    
    var body: some View {
        HStack {
            Text("1 EUR = \(String(format: "%.2f", rate))PLN") // Local Currency Detail Top. This currency should be selected manualy, or automaticaly based on location
            Spacer()
            Text(label)
                .foregroundStyle(.cyan)
        }
        .foregroundStyle(.gray)
    }
}

#Preview {
    CurrencyActionHeaderView(rate: 4.34, label: "Amount")
    CurrencyActionHeaderView(rate: 0.23, label: "Converted Amount")
}
