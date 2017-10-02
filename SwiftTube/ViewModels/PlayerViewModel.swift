//
//  PlayerParameters.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 28/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import Foundation

struct PlayerViewModel {

     let event = PlayerEvents()
     let state = PlayerState()
    
    func events() -> [String: AnyObject] {
        return  event.defaultParameters()
    }
    
    func video(videoId: String) -> [String: AnyObject] {
        return event.videoParameters(videoId: videoId)
    }
    
    func playerParameters(parameters: [String: AnyObject]) -> [String: AnyObject] {
        
        return [
            "height": "100%" as AnyObject,
            "width": "100%" as AnyObject,
            "events": event.defaultParameters() as AnyObject,
            "playerVars": parameters as AnyObject
        ]
    }
    
}

