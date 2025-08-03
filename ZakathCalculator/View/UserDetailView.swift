//
//  UserDetailView.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-08-03.
//

import SwiftUI

struct UserDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var user: User
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Hi, \(user.name)!")
            }
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title)
            .foregroundColor(Color.white)
            .padding(.vertical,15)
            .padding(.horizontal,34)
            .background(
                LinearGradient(
                    colors: [Color.blue, Color.purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar { 
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 17, weight: .semibold))
                        Text("All Users")
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
    
}

#Preview {
    UserDetailView(user: User(name: "Hermione Granger", email: "myemail@gmail.com", isWorking: true, createdOn: .now))
}
