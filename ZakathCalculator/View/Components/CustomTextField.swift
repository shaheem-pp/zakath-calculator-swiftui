//
//  CustomTextField.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI

struct CustomTextField: View {
    var label: String? = nil
    var placeholder: String
    @Binding var text: String
    var icon: String? = nil
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let label = label {
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            let content = HStack(spacing: 12) {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(.gray)
                }
                
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                            .keyboardType(keyboardType)
                            .focused($isFocused)
                    } else {
                        TextField(placeholder, text: $text)
                            .keyboardType(keyboardType)
                            .focused($isFocused)
                    }
                }
            }
            
            content
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            LinearGradient(
                                colors: isFocused ? [Color.blue, Color.purple] : [Color.gray.opacity(0.25), Color.gray.opacity(0.25)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: isFocused ? 2 : 1
                        )
                        .animation(.easeInOut(duration: 0.2), value: isFocused)
                )
                .font(.system(size: 16, weight: .medium, design: .rounded))
        }
    }
}

#Preview {
    @State var name = ""
    @State var email = ""

    return VStack(spacing: 16) {
        CustomTextField(label: "Enter your Name", placeholder: "Name", text: $name, icon: "person")
        CustomTextField(label: "Enter your Email", placeholder: "Email", text: $email, icon: "envelope", keyboardType: .emailAddress)
    }
    .padding()
}
