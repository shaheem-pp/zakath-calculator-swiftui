//
//  UserListItemView.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI

struct UserListItemView: View {
    
    let user: User
    @State private var isPressed = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(backgroundGradient)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderGradient, lineWidth: user.isWorking ? 2 : 0)
            )
            .shadow(
                color: shadowColor,
                radius: isPressed ? 2 : 6,
                x: 0,
                y: isPressed ? 1 : 3
            )
            .overlay(
                HStack(spacing: 16) {
                    // Status Indicator
                    statusIndicator
                    
                    // User Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text(user.name)
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        
                        statusText
                    }
                    
                    Spacer()
                    
                    // Subtle interaction hint
                    if user.isWorking {
                        interactionHint
                    }
                }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
            )
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
            .onTapGesture {
                // Handle tap action here
                print("Tapped user: \(user.name)")
            }
            .frame(height: 100)
    }
    
    // MARK: - Computed Properties
    
    private var backgroundGradient: LinearGradient {
        if user.isWorking {
            return LinearGradient(
                colors: [
                    Color.blue.opacity(0.05),
                    Color.purple.opacity(0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return LinearGradient(
                colors: [Color(.systemBackground)],
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
    
    private var borderGradient: LinearGradient {
        LinearGradient(
            colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private var shadowColor: Color {
        user.isWorking ?
        Color.green.opacity(0.2) :
        Color.black.opacity(0.2)
    }
    
    private var statusIndicator: some View {
        Circle()
            .fill(user.isWorking ?
                  LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom) :
                    LinearGradient(colors: [.gray.opacity(0.3)], startPoint: .top, endPoint: .bottom)
            )
            .frame(width: 12, height: 12)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 2)
            )
    }
    
    private var statusText: some View {
        Text(user.isWorking ? "Eligible for Paying Zakath" : "Not Required")
            .font(.caption.weight(.medium))
            .foregroundColor(user.isWorking ? .green : .secondary)
    }
    
    private var interactionHint: some View {
        Image(systemName: "chevron.right")
            .font(.caption)
            .foregroundColor(.blue.opacity(0.6))
            .scaleEffect(0.8)
    }
}


#Preview {
    VStack(spacing: 16) {
        UserListItemView(user: User(name: "Ahmed Hassan", email: "ahmed.hassan@example.com", isWorking: true, createdOn: .now))
        
        UserListItemView(user: User(name: "Sarah Johnson", email: "sarah.j.long.email@example.com", isWorking: false, createdOn: .now))
    }.padding(.horizontal)
}
