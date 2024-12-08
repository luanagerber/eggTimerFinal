//
//  TimerViewModel.swift
//  EggTimer
//
//  Created by Maria Tereza Martins Pérez on 05/12/24.
//
import Foundation
import SwiftUI

class TimerViewModel: ObservableObject, @unchecked Sendable {
    @Published var timeRemaining: Int = 0 // Tempo restante
    @Published var timerRunning: Bool = false // Estado do timer
    @Published var progress: Double = 0.0 // Progresso do timer (0.0 a 1.0)
    
    private var timer: Timer?
    private var totalTime: Int = 0 // Tempo total definido
    
    func startTimer(duration: Int) {
        
        let mp3Files = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        
        totalTime = duration
        timeRemaining = duration
        progress = 1.0
        timerRunning = true
        timer?.invalidate() // Para garantir que não haja múltiplos timers
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.progress = Double(self.timeRemaining) / Double(self.totalTime)
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerRunning = false
        progress = 0.0
        
        // Toca o som ao terminar o temporizador
        Task { @MainActor in
            AudioManager.shared.playSound(named: .kitchenTimer)
        }
    }
}
