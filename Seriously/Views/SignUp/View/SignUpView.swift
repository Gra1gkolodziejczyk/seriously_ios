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
                Text("SignUp View")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}