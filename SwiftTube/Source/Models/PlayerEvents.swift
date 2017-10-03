//
//  PlayerEvents.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 28/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import Foundation

public enum YouTubePlayerEvents: String {
    case youTubeIframeAPIReady = "onYouTubeIframeAPIReady"
    case ready = "onReady"
    case stateChange = "onStateChange"
    case playbackQualityChange = "onPlaybackQualityChange"
}

struct PlayerEvents {
    
    private var youTubeIframeAPIReady = "onYouTubeIframeAPIReady"
    private var ready = "onReady"
    private var stateChange = "onStateChange"
    private var playbackQualityChange = "onPlaybackQualityChange"
    private var error = "onError"
    private var videoId = "videoId"
    
    func defaultParameters() -> [String: AnyObject] {
        return  [
            ready: ready as AnyObject,
            stateChange: stateChange as AnyObject,
            playbackQualityChange: playbackQualityChange as AnyObject,
            error: error as AnyObject
        ]
    }
    
    func videoParameters(videoId: String) -> [String: AnyObject] {
        return  [
            ready: ready as AnyObject,
            stateChange: stateChange as AnyObject,
            playbackQualityChange: playbackQualityChange as AnyObject,
            error: error as AnyObject,
            videoId: videoId as AnyObject
        ]
    }
}
