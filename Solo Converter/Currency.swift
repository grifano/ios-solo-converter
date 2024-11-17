//
//  Currency.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 13/11/2024.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case eur = 4.38
    case usd = 3.98
    case pln = 1
    
    var id: Currency {self}
    
    var name: String {
        switch self {
        case .eur: return "EUR"
        case .usd: return "USD"
        case .pln: return "PLN"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .eur: return .eurflag
        case .usd: return .usdflag
        case .pln: return .plnflag
        }
    }
}
