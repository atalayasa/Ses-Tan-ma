//
//  MainVC.swift
//  Katip
//
//  Created by Atalay Aşa on 12/08/2017.
//  Copyright © 2017 Atalay Asa. All rights reserved.
//
import UIKit
import Speech
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {
    
    var recordButton: UIButton!
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
    }

    @IBAction func playBtnIsPressed(_ sender: AnyObject) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("Error!")
                    }
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("There was an error: \(error)")
                        } else {
                            self.transcriptionTextField.text = result?.bestTranscription.formattedString
                        }
                    }
                }
            }
        }
    }
}
