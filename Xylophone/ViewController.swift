//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // audio visual founational module

class ViewController: UIViewController {
    
    
    var player: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    // a switch is used intentionally for practice purposes, this can be resolved by a simpler way
    // by using sender.currentTitle, and fixing "wav" inside playSound()
    @IBAction func keyPressed(_ sender: UIButton) {
        
        // get the name of the button pressed
        let buttonTitle = sender.titleLabel?.text
        
        sender.alpha = 0.5
     
        if ((buttonTitle) != nil){
            switch buttonTitle{
            case "C":playSound(name: "C", type: "wav")
            case "D" : playSound(name: "D", type: "wav")
            case "E" : playSound(name: "E", type: "wav")
            case "F": playSound(name: "F", type: "wav")
            case "G": playSound(name: "G", type: "wav")
            case "A": playSound(name: "A", type: "wav")
            case "B": playSound(name: "B", type: "wav")
            default :
                
                break
            }
        }
        // the UI remains responsive with dispatching, better than Thread.sleep
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1
        }
     
            
        
        
    }
    
    
    
    
    
    // function to play a sound from the assets
    func playSound(name : String, type:String) {
        guard let path = Bundle.main.path(forResource: name, ofType:type) else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    

}

