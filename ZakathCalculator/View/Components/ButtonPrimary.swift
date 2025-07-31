//
//  ButtonPrimary.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI

struct ButtonPrimary: View {
    var title: String = "Click Here"
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity) // Only once here
                .background(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(12)
        }
    }
}

#Preview {
    VStack {
        ButtonPrimary(title: "Continue") {
            print("Tapped")
        }
        ButtonPrimary(title: "Hola") {
            print("Hi")
        }
    }
}
