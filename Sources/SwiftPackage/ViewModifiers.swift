//
//  ViewModifiers.swift
//  RLGUIComponents
//
//  Created by Aparna Duddekunta on 08/05/25.
//
import SwiftUI

struct RLGButtonStyle:ViewModifier {
    
func body (content:Content) -> some View {
        content
        .frame(maxWidth: .infinity, maxHeight: 48, alignment: .center)
    .cornerRadius(8)
    }

}
