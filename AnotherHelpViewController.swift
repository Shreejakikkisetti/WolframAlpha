//
//  AnotherHelpViewController.swift
//  Wolfram-Omega
//
//  Created by Ayesha Nabiha on 7/20/18.
//  Copyright © 2018 Ayesha Nabiha. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class AnotherHelpViewController: UIViewController {

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    playVideo()
    
}

private func playVideo() {
    
    guard let path = Bundle.main.path(forResource: "Demo", ofType: "mov") else {
        debugPrint("Demo.mov not found")
        return
    }
    let player = AVPlayer(url: URL(fileURLWithPath: path))
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = CGRect(x: 15, y: 175, width: 350, height: 400)
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
