//
//  AudioManager.swift
//  EggTimer
//
//  Created by Luana Gerber on 05/12/24.
//

// Importa bibliotecas que trazem funcionalidades essenciais para o aplicativo.
import Foundation
import AVFoundation

@MainActor
class AudioManager {
    
    // Cria uma única instância da classe AudioManager para ser usada por todo o aplicativo.
    static let shared = AudioManager()
    
    // Armazena os sons que estão sendo gerenciados no momento.
    private var audioPlayers: [AudioNames: AVAudioPlayer] = [:]
    
    // Garante que ninguém mais consiga criar outra instância da classe.
    private init() { }
    
    // Lista (enumeração) de nomes de arquivos de som disponíveis no app.
    enum AudioNames: String {
        case kitchenTimer = "kitchen_timer.mp3" // Nome do arquivo de som do timer.
    }

    // Função que toca um som específico.
    func playSound(named: AudioNames, volume: Float = 1.0) {
        // Encontra o arquivo de áudio no app.
        guard let url = Bundle.main.url(forResource: named.rawValue, withExtension: nil) else {
            print("Audio file not found: \(named.rawValue)") // Mostra uma mensagem de erro se o arquivo não for encontrado.
            return
        }
        
        do {
            // Tenta configurar o player para tocar o arquivo de som.
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.volume = volume // Define o volume do som.
            audioPlayers[named] = audioPlayer // Salva o player no dicionário para controle futuro.
            audioPlayer.numberOfLoops = 0 // O som será tocado apenas uma vez.
            audioPlayer.play() // Começa a tocar o som.
        } catch {
            print("Failed to initialize audio player: \(error)") // Mostra uma mensagem de erro caso algo dê errado.
        }
    }
}
