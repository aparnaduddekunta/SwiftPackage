//
//  RLGButtonView.swift
//  RLGUIComponents
//
//  Created by Aparna Duddekunta on 08/05/25.
//
import SwiftUI

public enum ButtonStyleType {
    case primary
    case secondary
    case ghost
    case text
    case destructive
}

public struct RLGButtonView: View {
     public var styleType: ButtonStyleType
    public var title: String
     @Binding public var isFocused: Bool
    public var isDisabled: Bool = false
    public init(styleType: ButtonStyleType, title: String, isFocused: Binding<Bool>, isDisabled: Bool) {
        self.styleType = styleType
        self.title = title
        self._isFocused = isFocused
        self.isDisabled = isDisabled
    }

    public var body: some View {
        Button(action: {
            // Action
        }) {
            Text(title)
                .modifier(RLGButtonStyle())
                .background(getBackgroundColor())
                .foregroundColor(getForegroundColor())
            
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(getCornerRadiusColor(),lineWidth: 2))

                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(getBorderColor(), lineWidth: isFocused ? 2 : 0))

            
        }
        .padding([.horizontal], 20)

        .disabled(isDisabled)
    }
    
    func getCornerRadiusColor() -> Color {
        if styleType == .ghost {
            return .black
        } else {
            return .clear
        }
    }
    func getBackgroundColor() -> Color {
        switch styleType {
        case .primary:
            return isDisabled ? .gray : .primary
        case .secondary:
            return isDisabled ? .gray : .secondary
        case .ghost:
            return .clear
        case .text:
            return .clear
        case .destructive:
            return isDisabled ? .gray : .destructive
        }
    }
    func getForegroundColor() -> Color {
        switch styleType {
        case .primary, .secondary, .destructive:
            return isDisabled ? .gray : .white
        case .ghost, .text:
            return isDisabled ? .gray : .black
        }
    }
    func getBorderColor() -> Color {
        if isFocused {
            return Color.red
        } else if styleType == .ghost  {
            return Color.black
        } else {
            return Color.clear
        }
    }
}


#Preview {
    RLGButtonView(styleType: .primary, title: "Primary Button", isFocused: .constant(true), isDisabled: false)
    RLGButtonView(styleType: .secondary, title: "Secondary Button", isFocused: .constant(true), isDisabled: false)
    RLGButtonView(styleType: .destructive, title: "Destructive Button", isFocused: .constant(true), isDisabled: false)
    RLGButtonView(styleType: .ghost, title: "Ghost Button", isFocused: .constant(true), isDisabled: false)
    RLGButtonView(styleType: .text, title: "Text Button", isFocused: .constant(true), isDisabled: false)

}
