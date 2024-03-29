//
//  AppButton.swift
//  Seriously
//
//  Created by Graig Kolodziejczyk on 04/03/2024.
//

import SwiftUI

enum IconPosition {
    case left, right, none
}

enum IconType {
    case systemName(String)
    case imageName(String)
    case none
}

struct AppButton: View {
    var icon: IconType
    var action: (() -> Void)?
    var label: String
    var iconPosition: IconPosition
    var backgroundColor: Color
    var isFullWidth: Bool
    var textColor: Color
    var imageSize: CGSize
    
    var body: some View {
        Button(action: action  ?? {}) {
            HStack {
                if iconPosition == .left, case let .systemName(iconName) = icon {
                    Image(systemName: iconName)
                } else if iconPosition == .left, case let .imageName(imageName) = icon {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                Text(label)
                    .foregroundColor(textColor)
                    .frame(maxWidth: isFullWidth ? .infinity : .none)
                if iconPosition == .right, case let .systemName(iconName) = icon {
                    Image(systemName: iconName)
                } else if iconPosition == .right, case let .imageName(imageName) = icon {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize.width, height: imageSize.height)
                }
            }
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

#Preview {
    VStack {
        AppButton(
            icon: .systemName("arrow.left"),
            action: {}, 
            label: "Icon a gauche",
            iconPosition: .left,
            backgroundColor: .blue,
            isFullWidth: true,
            textColor: .white,
            imageSize: CGSize(width: 20, height: 20)
        )
        AppButton(
            icon: .systemName("arrow.right"),
            action: {},
            label: "Icon à droite",
            iconPosition: .right,
            backgroundColor: .red,
            isFullWidth: false,
            textColor: .white,
            imageSize: CGSize(width: 20, height: 20)
        )
        AppButton(
            icon:  .none,
            action: {},
            label: "Juste du texte",
            iconPosition: .none,
            backgroundColor: .black,
            isFullWidth: true,
            textColor: .white,
            imageSize: CGSize(width: 0, height: 0)
        )
    }
    .padding()
}
