import SwiftUI

struct ContentView: View {
    @State private var amount: String = "0"
    @State private var fromCurrency: Currency = .eur
    @State private var toCurrency: Currency = .pln
    @State private var result: Double = 0.0

    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Heading
                HeadingView()

                
                // Converter Section
                VStack(spacing: 20) {
                    // From Currency
                    CurrencyActionHeaderView(rate: 4.24, label: "Amount")
                    CurrencyActionView(fromCurrency: $fromCurrency, amount: $amount)
                    
                    // Divider & Reverse button
                    ZStack {
                        Divider()
                            .background(.cyan)
                            .frame(height: 4)
                            .cornerRadius(4)
                        
                        Button {
                            // Optional: Add reverse functionality here
                        } label: {
                            Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                                .font(.title2)
                        }
                        .frame(width: 50, height: 50)
                        .background(.cyan)
                        .foregroundStyle(.white)
                        .cornerRadius(50)
                    }
                    
                    // To Currency (Fixed to PLN for now)
                    CurrencyActionHeaderView(rate: fromCurrency.rawValue, label: "Converted Amount")
                    CurrencyActionView(fromCurrency: $toCurrency, amount: .constant(String(format: "%.2f", convertedAmount)))
                }
                .padding(20)
                .background(.white)
                .cornerRadius(20)
                
                // Numeric Keyboard
                CustomKeyboardView(amount: $amount)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // Conversion logic
    private var convertedAmount: Double {
        let inputAmount = Double(amount) ?? 0
        return inputAmount * fromCurrency.rawValue
    }
}
