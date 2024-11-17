//
//  CustomKeyboardView.swift
//  Solo Converter
//
//  Created by Serhii Orlenko on 17/11/2024.
//

import SwiftUI

struct CustomKeyboardView: View {
    @Binding var amount: String

    let buttons: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "⌫"],
    ]

    var body: some View {
        VStack {
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in

                        Button(action: {
                            handleInput(button)
                        }) {
                            ZStack {
                                // Bg Color
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black.opacity(button == "." || button == "⌫" ? 0.1 : 0.4))
                                    .blendMode(.overlay)

                                    // Gradient Stroke
                                    .overlay(
                                        // Gradient Stroke Overlay
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                LinearGradient(
                                                    colors: [
                                                        Color(.white),
                                                        Color(
                                                            .white.opacity(0)),
                                                    ],
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                ),
                                                lineWidth: 4
                                            )
                                    )
                                    .blendMode(.overlay)

                                Text(button)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: 115, height: 61)
                        .cornerRadius(10)
                    }
                }
            }
        }
        .background(.cyan)
    }

    // Handle button press
    private func handleInput(_ input: String) {
        switch input {
        case "⌫":
            if !amount.isEmpty {
                amount.removeLast()
                if amount.isEmpty { amount = "0" }
            }
        case ".":
            if !amount.contains(".") {
                amount.append(".")
            }
        default:
            if amount == "0" {
                amount = input
            } else {
                amount.append(input)
            }
        }
    }
}

#Preview {
    CustomKeyboardView(amount: .constant("0"))
}
