//
//  FontManager.swift
//  EggTimer
//
//  Created by Luana Gerber on 05/12/24.
//


// Para entender melhor como editar esse arquivo: procurar no Figma "Fontes customizadas", na seção "Avançando em SwiftUI".


// Importa bibliotecas que trazem funcionalidades essenciais para o aplicativo.
import Foundation
import SwiftUI

@MainActor
class FontsManager {
    // Cria uma única instância da classe FontsManager para ser usada por todo o aplicativo.
    static let shared = FontsManager()
    
    // Garante que ninguém mais consiga criar outra instância da classe.
    private init() {}
    
    // Função para registrar fontes personalizadas no aplicativo.
    func registerFont(name: String, withExtension: String) {
        // Encontra o arquivo da fonte no app.
        let url = Bundle.main.url(forResource: name, withExtension: withExtension)! as CFURL
        // Registra a fonte encontrada para ser usada no app.
        CTFontManagerRegisterFontsForURL(url, CTFontManagerScope.process, nil)
    }
}

// Adiciona uma extensão para a classe Font, permitindo criar fontes personalizadas facilmente.
extension Font {
    // Função que retorna uma fonte personalizada com o nome "Futura" e o tamanho especificado.
    static func customFont(size: CGFloat) -> Font {
        .custom("Futura", size: size)
    }
}
