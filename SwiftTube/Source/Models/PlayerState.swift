import Foundation

public struct PlayerState {
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
