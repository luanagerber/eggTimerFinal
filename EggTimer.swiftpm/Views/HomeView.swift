//
//  HomeView.swift
//  EggTimer
//
//  Created by Luana Gerber on 04/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("userName") var name: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Constants.backgroundColor
                    .ignoresSafeArea()
                
                Image("Background")
                    .resizable()
                    .opacity(0.15)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Welcome to \nEgg Timer!")
                        .font(Constants.titleFont)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundStyle(Constants.fontColor)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: -70){
                        Image("egg_soft")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Image("egg_medium")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Image("egg_hard")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }.padding(10)
                    
                    
                    Text("We help you cook your eggs \njust the way you like them!")
                        .font(.system(size: Constants.subtitleFontSize))
                        .fontWeight(.regular)
                        .foregroundStyle(Constants.fontColor)
                        .multilineTextAlignment(.center)
                    
                    TextField("Write your name to start!", text: $name)
                        .font(.system(size: Constants.buttonFontSize))
                        .fontWeight(.semibold)
                        .foregroundColor(Constants.fontColor)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing, 40)
                        .padding(.leading, 40)
                    
                    Spacer()

                    NavigationLink(
                        destination: TimerView(), // Navega para TimerView
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
        }.tint(Constants.fontColor) // Set the back button and link color
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView ()
    }
}
