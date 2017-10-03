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

