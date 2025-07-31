//
//  AddUserView.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI

struct AddUserView: View {
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var viewModel = AddUserViewModel()
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            CustomTextField(label: "Enter your Name", placeholder: "Name", text: $viewModel.name, icon: "person")
            CustomTextField(label: "Enter your Email", placeholder: "Email", text: $viewModel.email, icon: "envelope")
            
            HStack {
                Text("Currently Employed")
                Spacer()
                Toggle("", isOn: $viewModel.isWorking)
                    .labelsHidden()
            }
            .tint(.blue)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.gray.opacity(0.15))
            .cornerRadius(10)
            .onTapGesture {
                viewModel.isWorking.toggle()
            }
            
            
            ButtonPrimary(title: "Create User") {
                let result = viewModel.createUser(using: modelContext)
                
                switch result {
                case .success:
                    print("User created successfully")
                    alertMessage = "User has been created successfully"
                    showAlert = true
                    viewModel.resetFields()
                    
                case .failure(let reason):
                    print("User creation failed: \(reason)")
                    alertMessage = reason
                    showAlert = true
                    
                }
            }
            .padding(.top, 32)
            .disabled(viewModel.name.isEmpty || viewModel.email.isEmpty)
            .opacity(viewModel.name.isEmpty || viewModel.email.isEmpty ? 0.5 : 1)
        }
        .padding(.horizontal, 32)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage))
        }
        
    }
}

#Preview {
    AddUserView()
}
