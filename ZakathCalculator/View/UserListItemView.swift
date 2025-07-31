//
//  UserListItemView.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI

struct UserListItemView: View {
    
    let user: User
    

    
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(.systemBackground))
            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            .overlay(
                HStack(alignment: .center, spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                            .font(.headline)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }
                .padding()
            )
            .frame(height: 100)
            .padding(.horizontal)
    }
}

#Preview {
    UserListItemView(user: User(name: "name", email: "myEmail@gmail.com", isWorking: true, createdOn: .now))
}
