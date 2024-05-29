//
//  SignUpView.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpViewModel()
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
                TextField("Entrer votre email", text: $viewModel.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .autocapitalization(.none)
                if !viewModel.emailErrorMessage.isEmpty {
                    Text(viewModel.emailErrorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 4)
                }
                SecureField("Entrer votre mot de passe", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .autocapitalization(.none)
                if !viewModel.passwordErrorMessage.isEmpty {
                    Text(viewModel.passwordErrorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 4)
                }
                AppButton(
                    icon: .none,
                    action: {},
                    label: "S'inscrire",
                    iconPosition: .none,
                    backgroundColor: .purple,
                    isFullWidth: true,
                    textColor: .white,
                    imageSize: CGSize(width: 0, height: 0)
                )
                .padding()
                Spacer()
                VStack {
                    Text("Tu as déjà un compte ?")
                        .foregroundStyle(.white)
                    NavigationLink(
                        destination: {
                            SignInView(viewModel: SignInViewModel())
                        }, label: {
                            Text("Connecte toi")
                                .foregroundStyle(.purple)
                        })
                }
            }
            .padding()
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
