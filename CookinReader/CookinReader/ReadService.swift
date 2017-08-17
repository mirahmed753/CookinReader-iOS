//
//  SpeakService.swift
//  CookinReader
//
//  Created by Mir Ahmed on 8/17/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import AVFoundation

struct ReadService {
    static func readRecipe(readElement: String) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: readElement)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        synthesizer.speak(utterance)
    }
}
