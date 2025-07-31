//
//  UsersList.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI
import SwiftData

struct UsersList: View {
    
    @Query private var users: [User]

    init() {
        print("All Users: \(users)")
    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(users, id: \.self) { user in
                    UserListItemView(user: user)
                }
            }
            .padding()
        }
    }
}

#Preview {
    UsersList()
        .modelContainer(for: User.self)
}
