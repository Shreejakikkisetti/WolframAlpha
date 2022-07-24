//
//  HelpViewController.swift
//  Wolfram-Omega
//
//  Created by Ayesha Nabiha on 7/18/18.
//  Copyright © 2018 Ayesha Nabiha. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class HelpViewController: UIViewController {
    
  @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        playVideo()
        
        //this set of code makes the continue button look nicer
        continueButton.layer.cornerRadius = 20
        continueButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        continueButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        continueButton.layer.shadowOpacity = 1.0
        continueButton.layer.shadowRadius = 0.0
        continueButton.layer.masksToBounds = false
        
        
    }
    
    private func playVideo() {
        
        guard let path = Bundle.main.path(forResource: "Delete", ofType: "mov") else {
            debugPrint("Delete.mov not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 15, y: 150, width: 350, height: 400)
        self.view.layer.addSublayer(playerLayer)
        player.play()
        loopVideo(videoPlayer: player)
        
    }
    
    private func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
                videoPlayer.seek(to: kCMTimeZero)
                videoPlayer.play()
        }
    }
    
}
