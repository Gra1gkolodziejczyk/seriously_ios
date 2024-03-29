//
//  AppBackground.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 02/03/2024.
//

import SwiftUI

struct AppBackground<Content: View>: View {
    
    let content: Content
        
        init(@ViewBuilder content: @escaping () -> Content) {
            self.content = content()
        }
        
    var body: some View {
        ZStack {
            Color(UIColor(red: 35/255, green: 23/255, blue: 50/255, alpha: 1))
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Circle()
                            .fill(Color(UIColor(red: 250/255, green: 79/255, blue: 173/255, alpha: 1)))
                            .frame(width: 225, height: 300)
                            .offset(x: -170, y: -250)
                            .blur(radius: 110)
                        Circle()
                            .fill(Color(UIColor(red: 102/255, green: 40/255, blue: 146/255, alpha: 1)))
                            .frame(width: 250, height: 300)
                            .offset(x: 170, y: 250)
                            .blur(radius: 80)
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
            content
        }
    }
}

#Preview {
    AppBackground( ) {
        Text("Exemple")
            .foregroundStyle(.white)
            .padding()
            .font(.title)
    }
}
