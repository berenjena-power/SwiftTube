import Foundation

public protocol PlayerDelegate {
    func playerReady(_ videoPlayer: PowerWebView)
    func playerStateChanged(_ videoPlayer: PowerWebView, playerState: PlayerState)
    func playerQualityChanged(_ videoPlayer: PowerWebView, playbackQuality: PlayerQuality)
}
