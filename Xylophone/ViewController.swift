//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var bombSoundEffect: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func playSound(_ sender: UIButton) {
        // also sender.currentTitle
        // will return name like C , A , B ,E
        
      //  perform(#selector(authenticate), with: nil, afterDelay: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.selectSound(soundName: (self.randomString())+".wav")
            
         //   print(self.randomString())
        }
    }
    
   
    
    
    
    func selectSound(soundName: String){
        let path = Bundle.main.path(forResource: soundName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
    func randomString() -> String {
      let arry = ["A","B","C","D","E","F","G"]
        
        let random = Int.random(in: 0..<arry.count)
        return arry[random]
    }

    

}

