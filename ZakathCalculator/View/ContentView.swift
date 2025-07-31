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
        NavigationView {
            UsersList()
                .navigationTitle("All Users")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowingAddUserSheet = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                    }
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
