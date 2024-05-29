//
//  HomeView.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 23/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            AppBackground() {
                VStack {
                    Text("Hello Home Page")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
