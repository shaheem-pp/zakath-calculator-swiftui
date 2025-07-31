//
//  AddUserViewWrapper.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI

struct AddUserViewWrapper: View {
    @Binding var isPresented: Bool
    @Environment(\.modelContext) private var modelContext

    @StateObject private var viewModel = AddUserViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                CustomTextField(label: "Enter your Name", placeholder: "Name", text: $viewModel.name, icon: "person")
                CustomTextField(label: "Enter your Email", placeholder: "Email", text: $viewModel.email, icon: "envelope")
                
                Toggle("Currently Employed", isOn: $viewModel.isWorking)
                    .tint(.blue)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(10)

                ButtonPrimary(title: "Create User") {
                    let result = viewModel.createUser(using: modelContext)
                    
                    switch result {
                    case .success:
                        alertMessage = "User has been created successfully"
                        showAlert = true
                        // Close modal after a short delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isPresented = false
                        }
                        
                    case .failure(let reason):
                        alertMessage = reason
                        showAlert = true
                    }
                }
                .padding(.top, 32)
                .disabled(viewModel.name.isEmpty || viewModel.email.isEmpty)
                .opacity(viewModel.name.isEmpty || viewModel.email.isEmpty ? 0.5 : 1)
            }
            .padding(.horizontal, 32)
            .navigationTitle("Add New User")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage))
            }
        }
    }
}

