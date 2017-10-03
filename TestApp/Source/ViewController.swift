import UIKit
import SwiftTube

class ViewController: UIViewController, PlayerDelegate {
 
    @IBOutlet weak var powerWebView: PowerWebView!
    var swiftTube: Player!
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftTube = Player(webView: powerWebView, delegate: self)
        swiftTube.loadVideoID(with: "")
    }

    func playerReady(_ videoPlayer: PowerWebView) {
        swiftTube.play()
    }
    
    func playerStateChanged(_ videoPlayer: PowerWebView, playerState: PlayerState) {
        
    }
    
    func playerQualityChanged(_ videoPlayer: PowerWebView, playbackQuality: PlayerQuality) {
        
    }

}

