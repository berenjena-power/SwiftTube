import UIKit
import SwiftTube

class ViewController: UIViewController, PlayerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func playerReady(_ videoPlayer: PowerWebView) {
//        play()
    }
    
    func playerStateChanged(_ videoPlayer: PowerWebView, playerState: PlayerState) {
        
    }
    
    func playerQualityChanged(_ videoPlayer: PowerWebView, playbackQuality: PlayerQuality) {
        
    }

}

