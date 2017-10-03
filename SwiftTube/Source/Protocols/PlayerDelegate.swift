//
//  PlayerDelegate.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 28/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import Foundation

public protocol PlayerDelegate {
    func playerReady(_ videoPlayer: PowerWebView)
    func playerStateChanged(_ videoPlayer: PowerWebView, playerState: PlayerState)
    func playerQualityChanged(_ videoPlayer: PowerWebView, playbackQuality: PlayerQuality)
}
