//
//  TimerView.swift
//  EggTimer
//
//  Created by Luana Gerber on 04/12/24.
//


// Para entender melhor como editar esse arquivo: procurar no Figma a seção "Elementos básicos do SwiftUI".


import SwiftUI

struct TimerView: View {
    
    @StateObject private var viewModel = TimerManager() // Instância da ViewModel para gerenciar o estado do timer.
    
    var body: some View {
        
        let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7] // Dicionário com os tempos de cozimento dos ovos.
        
        ZStack {
            Constants.backgroundColor
                .ignoresSafeArea() // Define a cor do fundo da tela, ocupando toda a area e ignorando a Safe Area.
            
            VStack(spacing: 20) {
                // Título principal
                Text("Egg Timer")
                    .font(Constants.titleFont)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundStyle(Constants.fontColor)
                    .multilineTextAlignment(.center)
                
                // Subtítulo
                Text("How would you like your eggs?")
                    .font(.system(size: Constants.subtitleFontSize))
                    .fontWeight(.regular)
                    .foregroundStyle(Constants.fontColor)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Botões para selecionar o tipo de cozimento
                HStack(spacing: 0) {
                    VStack {
                        Image("egg_soft") // Imagem do ovo "Soft".
                            .resizable()
                            .frame(width: 87, height: 120)
                        
                        // Botão para iniciar o timer no modo  "Soft".
                        Button(action: {
                            viewModel.startTimer(duration: eggTimes["Soft"] ?? 0)
                            print("Soft timer set: \(eggTimes["Soft"] ?? 0) minutes")
                        }) {
                            Text("Soft")
                                .font(.system(size: Constants.buttonFontSize))
                                .fontWeight(.semibold)
                                .foregroundColor(Constants.fontColor)
                                .padding()
                                .background(Constants.buttonBackgroundColor)
                                .cornerRadius(Constants.buttonCornerRadius)
                        }.padding()
                    }
                    
                    VStack {
                        Image("egg_medium") // Imagem do ovo "Medium".
                            .resizable()
                            .frame(width: 87, height: 120)
                        
                        // Botão para iniciar o timer no modo "Medium".
                        Button(action: {
                            viewModel.startTimer(duration: eggTimes["Medium"] ?? 0)
                            print("Medium timer set: \(eggTimes["Medium"] ?? 0) minutes")
                        }) {
                            Text("Medium")
                                .font(.system(size: Constants.buttonFontSize))
                                .fontWeight(.semibold)
                                .foregroundColor(Constants.fontColor)
                                .padding()
                                .background(Constants.buttonBackgroundColor)
                                .cornerRadius(Constants.buttonCornerRadius)
                        }.padding()
                    }
                    
                    VStack {
                        Image("egg_hard") // Imagem do ovo "Hard".
                            .resizable()
                            .frame(width: 87, height: 120)
                        
                        // Botão para iniciar o timer no modo  "Hard".
                        Button(action: {
                            viewModel.startTimer(duration: eggTimes["Hard"] ?? 0)
                            print("Hard timer set: \(eggTimes["Hard"] ?? 0) minutes")
                        }) {
                            Text("Hard")
                                .font(.system(size: Constants.buttonFontSize))
                                .fontWeight(.semibold)
                                .foregroundColor(Constants.fontColor)
                                .padding()
                                .background(Constants.buttonBackgroundColor)
                                .cornerRadius(Constants.buttonCornerRadius)
                        }.padding()
                    }
                }
                
                Spacer()
                
                // Exibe o tempo restante e muda a cor com base no estado do timer.
                HStack {
                    Text("Time left:")
                        .font(.system(size: Constants.textFontSize))
                        .fontWeight(.regular)
                        .foregroundStyle(Constants.fontColor)
                    
                    Text("\(viewModel.timeRemaining) seconds")
                        .font(.system(size: Constants.textFontSize))
                        .fontWeight(.semibold)
                        .foregroundColor(Constants.fontColor)
                        .padding(6)
                        .background(viewModel.timerRunning ? Color("customOrange") : .green.opacity(0.8))
                        .cornerRadius(Constants.buttonCornerRadius)
                }
            }
            .padding(.top, 70)
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    TimerView() //Visualização da prévia da interface no XCode.
}
