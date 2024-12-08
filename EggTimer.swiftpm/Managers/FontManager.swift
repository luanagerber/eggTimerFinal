//
//  FontManager.swift
//  EggTimer
//
//  Created by Luana Gerber on 05/12/24.
//

import Foundation
import SwiftUI
 
@MainActor
class FontsManager {
    static let shared = FontsManager()
    
    private init(){}
    
    func registerFont(name: String, withExtension: String) {
        let url = Bundle.main.url(forResource: name, withExtension: withExtension)! as CFURL
        CTFontManagerRegisterFontsForURL(url, CTFontManagerScope.process, nil)
    }
}

extension Font {
    static func customFont(size: CGFloat) -> Font {
        .custom("Futura", size: size)
    }
}
