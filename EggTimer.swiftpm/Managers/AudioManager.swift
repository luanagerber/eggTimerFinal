//
//  AudioManager.swift
//  EggTimer
//
//  Created by Luana Gerber on 05/12/24.
//

import Foundation
import SpriteKit
import AVFoundation

@MainActor
class AudioManager {
    
    static let shared = AudioManager()
    
    private var audioPlayers: [AudioNames: AVAudioPlayer] = [:]
    
    private init() { }
    
    enum AudioNames: String {
        case kitchenTimer = "kitchen_timer.mp3"
    }

    // Sound effect functions
    func playSound(named: AudioNames, volume: Float = 1.0) {
        guard let url = Bundle.main.url(forResource: named.rawValue, withExtension: nil) else {
            print("Audio file not found: \(named.rawValue)")
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.volume = volume
            audioPlayers[named] = audioPlayer
            audioPlayer.numberOfLoops = 0
            audioPlayer.play()
        } catch {
            print("Failed to initialize audio player: \(error)")
        }
    }

}
