//
//  StartView.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import SwiftUI

struct StartView: View {
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
                    NavigationLink {
                        SignUpView()
                    } label: {
                        AppButton(
                            icon: .none,
                            label: "Créer mon compte",
                            iconPosition: .none,
                            backgroundColor: .black,
                            isFullWidth: true,
                            textColor: .white,
                            imageSize: CGSize(width: 0, height: 0)
                        )
                        .padding(.horizontal)
                    }
                    AppButton(
                        icon: .imageName("google"),
                        action: {},
                        label: "S'inscrire avec google",
                        iconPosition: IconPosition.left,
                        backgroundColor: .black,
                        isFullWidth: true,
                        textColor: .white,
                        imageSize: CGSize(width: 18, height: 30)
                    )
                    .padding(.horizontal)
                    AppButton(
                        icon: .systemName("apple.logo"),
                        action: {}, label: "S'inscrire avec Apple",
                        iconPosition: IconPosition.left,
                        backgroundColor: .black,
                        isFullWidth: true,
                        textColor: .white,
                        imageSize: CGSize(width: 30, height: 30)
                    )
                    .padding(.horizontal)
                    Spacer()
                    HStack {
                        Text("Tu as déjà un compte ?")
                            .foregroundStyle(.white)
                        NavigationLink(
                            destination: {
                                SignInView(viewModel: SignInViewModel())
                            }, label: {
                            Text("Se connecter")
                                .foregroundStyle(.purple)
                        })
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    StartView()
}
