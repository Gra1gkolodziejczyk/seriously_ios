//
//  ResetPasswordView.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import SwiftUI

struct ResetPasswordView: View {
    @ObservedObject var viewModel = ResetPasswordViewModel()
    
    var body: some View {
            AppBackground() {
                VStack {
                    Image("seriously")
                        .resizable()
                        .frame(width: 333, height: 333)
                    Text("Seriously")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Spacer()
                    TextField("Entrer votre nouveau mot de passe", text: $viewModel.newPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .autocapitalization(.none)
                    TextField("Confirmer votre nouveau mot de passe", text: $viewModel.confirmNewPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .autocapitalization(.none)
                    AppButton(
                        icon: .none,
                        action: {
                            viewModel.resetPassword()
                        },
                        label: "Réinitialiser votre mot de passe",
                        iconPosition: .none,
                        backgroundColor: .purple,
                        isFullWidth: true,
                        textColor: .white,
                        imageSize: CGSize(width: 0, height: 0)
                    )
                    .padding()
                    Spacer()
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView(viewModel: ResetPasswordViewModel())
    }
}
