//
//  UsersList.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI
import SwiftData

struct UsersList: View {
    
    @Query(sort: [SortDescriptor<User>(\User.createdOn, order: .reverse)]) private var users: [User]
    @State private var selectedUser: User? = nil

    var body: some View {
        List {
            if users.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray.opacity(0.5))
                    
                    Text("No users found")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Text("Tap the + button to add your first user.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 100)
                .listRowSeparator(.hidden)
            } else {
                ForEach(users) { user in
                    UserListItemView(user: user)
                        .background(NavigationLink(value: user) { EmptyView() }.opacity(0))
                        .disabled(!user.isWorking)
                }
                .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    UsersList()
        .modelContainer(for: User.self)
}
