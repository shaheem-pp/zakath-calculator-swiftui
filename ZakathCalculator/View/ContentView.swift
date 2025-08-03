//
//  ContentView.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isShowingAddUserSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                UsersList()
                
                Button(action: {
                    isShowingAddUserSheet = true
                }) {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(LinearGradient(
                            colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        )
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 10, x: 0, y: 5)
                }
                .padding()
            }
            .navigationTitle("All Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .sheet(isPresented: $isShowingAddUserSheet) {
                AddUserViewWrapper(isPresented: $isShowingAddUserSheet)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
