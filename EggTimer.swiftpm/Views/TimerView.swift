//
//  TimerView.swift
//  EggTimer
//
//  Created by Luana Gerber on 04/12/24.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject private var viewModel = TimerViewModel() // Criando instância da ViewModel

    var body: some View {
                
        let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
        let name = UserDefaults.standard.string(forKey: "userName") ?? ""
        
        ZStack {
            Constants.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Text("Egg Timer")
                    .font(Constants.titleFont)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundStyle(Constants.fontColor)
                    .multilineTextAlignment(.center)
                
                Text("Hello \(name), \nhow would you like your eggs?")
                    .font(.system(size: Constants.subtitleFontSize))
                    .fontWeight(.regular)
                    .foregroundStyle(Constants.fontColor)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack(spacing: 0){
                    VStack{
                        Image("egg_soft")
                            .resizable()
                            .frame(width: 120, height: 120)
                                                
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
                    
                    VStack{
                        Image("egg_medium")
                            .resizable()
                            .frame(width: 120, height: 120)
                                                
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
                    
                    VStack{
                        Image("egg_hard")
                            .resizable()
                            .frame(width: 120, height: 120)
                        
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
             
                HStack{
                    Text("Time left:")
                        .font(.system(size: Constants.textFontSize))
                        .fontWeight(.regular)
                        .foregroundStyle(Constants.fontColor)
                    
                    // Exibe o tempo restante
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView ()
    }
}
