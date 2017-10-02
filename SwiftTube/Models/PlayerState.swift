//
//  PlayerState.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 28/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import Foundation



struct PlayerState {
    enum PlayerState {
        case unstarted
        case ended
        case playing
        case paused
        case buffering
        case queued
    }
    var state:PlayerState = .unstarted
    
    func state(with stateString: String) {
        
    }
}
