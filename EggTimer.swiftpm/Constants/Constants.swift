//
//  Constants.swift
//  EggTimer
//
//  Created by Luana Gerber on 04/12/24.
//

import SwiftUI
import CoreFoundation

// Para entender mais sobre esse contéudo procurar no Figma "Folha de Estilos"
struct Constants {
    //Element Colors
    static let backgroundColor = Color("lightBlue")
    static let buttonBackgroundColor = Color.blue
    
    //Font Colors
    static let fontColor = Color.black
    
    //Element Sizes
    static let buttonCornerRadius: CGFloat = 10
    
    //Font Sizes
    static let titleFontSize: CGFloat = 48
    static let subtitleFontSize: CGFloat = 22
    static let buttonFontSize: CGFloat = 20
    static let textFontSize: CGFloat = 20
    
    static let titleFont = Font.customFont(size: Constants.titleFontSize)
    
}
