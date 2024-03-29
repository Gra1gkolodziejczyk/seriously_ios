//
//  SignInView.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State private var errorMessage: String = ""

    var body: some View {
        AppBackground() {
            VStack {
                if viewModel.isLoggedIn {
                    HomeView()
                } else {
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
                        action: {
                            self.viewModel.login()
                        },
                        label: "Se connecter",
                        iconPosition: .none,
                        backgroundColor: .purple,
                        isFullWidth: true,
                        textColor: .white,
                        imageSize: CGSize(width: 0, height: 0)
                    )
                    .padding()
                    Spacer()
                    VStack {
                        Text("Tu as oublié ton mot de passe ?")
                            .foregroundStyle(.white)
                        NavigationLink(
                            destination: {
                                ResetPasswordView()
                            }, label: {
                                Text("Reinitialise ton mot de passe")
                                    .foregroundStyle(.purple)
                            })
                    }
                }
            }
            .padding()
        }
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
