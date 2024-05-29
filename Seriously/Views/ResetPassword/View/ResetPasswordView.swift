//
//  ResetPasswordView.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import SwiftUI

struct ResetPasswordView: View {
    var body: some View {
        NavigationView {
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
                    TextField("Entrer votre email", text: <#Binding<String>#>)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .autocapitalization(.none)
                    SecureField("Entrer votre mot de passe", text: <#Binding<String>#>)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .autocapitalization(.none)
                    AppButton(
                        icon: .none,
                        action: {},
                        label: "Se connecter",
                        iconPosition: .none,
                        backgroundColor: .purple,
                        isFullWidth: true,
                        textColor: .white,
                        imageSize: CGSize(width: 0, height: 0)
                    )
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
