//
//  MusicPlayer.swift
//  MarkdownTutor
//
//  Created by 蕭博文 on 2024/2/9.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
var shortAudioPlayer: AVAudioPlayer?

func startBackgroundMusic() {
    if let bundle = Bundle.main.path(forResource: "bgm", ofType: "mp3") {
        let backgroundMusic = NSURL(fileURLWithPath: bundle)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
}

func stopBackgroundMusic() {
    guard let audioPlayer = audioPlayer else { return }
    audioPlayer.stop()
}


func playWAMusic() {
    if let bundle = Bundle.main.path(forResource: "wrong", ofType: "mp3") {
        let shortMusic = NSURL(fileURLWithPath: bundle)
        do {
            shortAudioPlayer = try AVAudioPlayer(contentsOf:shortMusic as URL)
            guard let shortAudioPlayer = shortAudioPlayer else { return }
            shortAudioPlayer.prepareToPlay()
            shortAudioPlayer.play()
        } catch {
            print(error)
        }
    }
}


func playCAMusic() {
    if let bundle = Bundle.main.path(forResource: "correct", ofType: "mp3") {
        let shortMusic = NSURL(fileURLWithPath: bundle)
        do {
            shortAudioPlayer = try AVAudioPlayer(contentsOf:shortMusic as URL)
            guard let shortAudioPlayer = shortAudioPlayer else { return }
            shortAudioPlayer.prepareToPlay()
            shortAudioPlayer.play()
        } catch {
            print(error)
        }
    }
}

func playCongratsMusic() {
    if let bundle = Bundle.main.path(forResource: "congrats", ofType: "mp3") {
        let shortMusic = NSURL(fileURLWithPath: bundle)
        do {
            shortAudioPlayer = try AVAudioPlayer(contentsOf:shortMusic as URL)
            guard let shortAudioPlayer = shortAudioPlayer else { return }
            shortAudioPlayer.prepareToPlay()
            shortAudioPlayer.play()
        } catch {
            print(error)
        }
    }
}
