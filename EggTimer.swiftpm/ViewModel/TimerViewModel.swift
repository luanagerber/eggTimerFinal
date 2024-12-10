//
//  TimerViewModel.swift
//  EggTimer
//
//  Created by Maria Tereza Martins Pérez on 05/12/24.
//


// Este arquivo contém o timer e a função que toca o timer ao final do progresso. Não se preocupe com este arquivo.


// Importa bibliotecas essenciais.
import Foundation
import SwiftUI

class TimerViewModel: ObservableObject, @unchecked Sendable {
    // Variáveis que armazenam o estado do timer e atualizam a interface automaticamente.
    @Published var timeRemaining: Int = 0 // Tempo restante do timer, em segundos.
    @Published var timerRunning: Bool = false // Indica se o timer está ativo ou não.
    @Published var progress: Double = 0.0 // Representa o progresso do timer (0.0 para 0%, 1.0 para 100%).
    
    private var timer: Timer? // Referência ao temporizador em execução.
    private var totalTime: Int = 0 // Tempo total configurado para o timer.
    
    // Função que inicia o timer.
    func startTimer(duration: Int) {
        totalTime = duration // Define o tempo total.
        timeRemaining = duration // Define o tempo restante.
        progress = 1.0 // Inicia o progresso no máximo (100%).
        timerRunning = true // Marca o timer como ativo.
        timer?.invalidate() // Garante que nenhum outro timer esteja rodando.
        
        // Cria um novo timer que diminui o tempo restante a cada segundo.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return } // Evita erros caso o timer seja descartado.
            
            if self.timeRemaining > 0 {
                // Diminui o tempo restante e atualiza o progresso.
                self.timeRemaining -= 1
                self.progress = Double(self.timeRemaining) / Double(self.totalTime)
            } else {
                // Para o timer quando o tempo se esgota.
                self.stopTimer()
            }
        }
    }
    
    // Função que para o timer.
    func stopTimer() {
        timer?.invalidate() // Cancela o timer em execução.
        timer = nil // Remove a referência ao timer.
        timerRunning = false // Marca o timer como inativo.
        progress = 0.0 // Reseta o progresso para 0%.
        
        // Reproduz um som para indicar que o tempo terminou.
        Task { @MainActor in
            AudioManager.shared.playSound(named: .kitchenTimer)
        }
    }
}
