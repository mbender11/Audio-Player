//
//  ViewController.swift
//  Audio Player
//
//  Created by Mason Bender on 2/26/18.
//  Copyright © 2018 Mason Bender. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "HoldingOn", ofType: "mp3")
    var timer = Timer()
    
    @objc func updatePositionSlider() {
        positionSlider.value = Float(audioPlayer.currentTime)
    }
    
    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updatePositionSlider), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        audioPlayer.pause()
        timer.invalidate()
    }
    
    // this is volume slider
    @IBAction func volumeUpdated(_ sender: Any) {
        audioPlayer.volume = slider.value
    }
    
    // this is volume slider
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func positionSliderUpdated(_ sender: Any) {
        audioPlayer.currentTime = TimeInterval(positionSlider.value)
    }
    
    @IBOutlet weak var positionSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            positionSlider.maximumValue = Float(audioPlayer.duration)
        } catch {
            // error handling
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

