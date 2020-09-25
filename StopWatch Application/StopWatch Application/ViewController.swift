//
//  ViewController.swift
//  StopWatch Application
//
//  Created by admin on 24.09.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    var player = AVAudioPlayer()

    var toggleState = 1
    
    @IBAction func playPauseButtonF(_ sender: Any) {
    
        let playPauseBtnF = sender as! UIButton
        if toggleState == 1 {
            player.play()
            toggleState = 2
            playPauseBtnF.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
        } else {
            player.pause()
            toggleState = 1
            playPauseBtnF.setImage(UIImage(named:"play"),for:UIControl.State.normal)
        }
    }
    
    @IBAction func playPauseButtonB(_ sender: Any) {
        let playPauseBtnB = sender as! UIButton
               if toggleState == 1 {
                   player.play()
                   toggleState = 2
                   playPauseBtnB.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
               } else {
                   player.pause()
                   toggleState = 1
                   playPauseBtnB.setImage(UIImage(named:"play"),for:UIControl.State.normal)
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

    

