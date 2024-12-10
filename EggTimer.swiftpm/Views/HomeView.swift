//
//  HomeView.swift
//  EggTimer
//
//  Created by Luana Gerber on 04/12/24.
//


// Para entender melhor como editar esse arquivo: procurar no Figma a seção "Elementos básicos do SwiftUI".


import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack { // Gerencia a navegação entre telas.
            ZStack {
                Constants.backgroundColor
                    .ignoresSafeArea() // Define a cor de fundo ocupando toda a tela e ignorando a Safe Area.
                
                Image("Background") // Imagem de fundo decorativa.
                    .resizable()
                    .opacity(0.15) // Define a transparência da imagem.
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    // Título principal da tela.
                    Text("Welcome to \nEgg Timer!")
                    // o \n adiciona a quebra de linha.
                        .font(Constants.titleFont)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundStyle(Constants.fontColor)
                        .multilineTextAlignment(.center)
                    
                    // Imagens dos ovos para decorar a interface.
                    HStack(spacing: -15) {
                        Image("egg_soft")
                            .resizable()
                            .frame(width: 110, height: 150)
                        Image("egg_medium")
                            .resizable()
                            .frame(width: 110, height: 150)
                        Image("egg_hard")
                            .resizable()
                            .frame(width: 110, height: 150)
                    }.padding(10)
                    
                    // Subtítulo explicativo.
                    Text("We help you cook your eggs \njust the way you like them!")
                        .font(.system(size: Constants.subtitleFontSize))
                        .fontWeight(.regular)
                        .foregroundStyle(Constants.fontColor)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Botão que navega para a tela do temporizador (TimerView).
                    NavigationLink(
                        destination: TimerView(),
                        label: {
                            Text("Start timer")
                                .font(.system(size: Constants.buttonFontSize))
                                .fontWeight(.semibold)
                                .foregroundColor(Constants.fontColor)
                                .padding()
                                .background(Constants.buttonBackgroundColor)
                                .cornerRadius(Constants.buttonCornerRadius)
                        }
                    )
                }
                .padding(.top, 70)
                .padding(.bottom, 50)
            }
        }
        .tint(Constants.fontColor) // Define a cor do botão "Voltar".
    }
}

#Preview {
    HomeView() // Visualização da prévia da interface no Xcode.
}
