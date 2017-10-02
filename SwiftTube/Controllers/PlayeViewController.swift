//
//  Player.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 27/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    fileprivate var webView = PowerWebView()
    fileprivate var viewModel = PlayerViewModel()
    var delegate: PlayerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.frame
        webView.delegate = self
        delegate = self
        view.addSubview(webView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadWebViewWithParameters(viewModel.playerParameters(parameters: [String : AnyObject]()))
    }
    
     func loadVideoID(with videoId: String) {
        guard let videoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
            return
        }
        webView.loadRequest(URLRequest(url: videoURL))
    }
    
    func load(with URLString: String) {
        guard let videoURL = URL(string: URLString) else {
            return
        }
        webView.loadRequest(URLRequest(url: videoURL))
    }
    
 
    // MARK: Player controls
    
    open func mute() {
        _ = evaluatePlayerCommand("mute()")
    }
    
    open func unMute() {
        _ = evaluatePlayerCommand("unMute()")
    }
    
    open func play() {
        _ = evaluatePlayerCommand("playVideo()")
    }
    
    open func pause() {
        _ = evaluatePlayerCommand("pauseVideo()")
    }
    
    open func stop() {
        _ = evaluatePlayerCommand("stopVideo()")
    }
    
    open func clear() {
        _ = evaluatePlayerCommand("clearVideo()")
    }
    
    open func seekTo(_ seconds: Float, seekAhead: Bool) {
        _ = evaluatePlayerCommand("seekTo(\(seconds), \(seekAhead))")
    }
    
    open func getDuration() -> String? {
        return evaluatePlayerCommand("getDuration()")
    }
    
    open func getCurrentTime() -> String? {
        return evaluatePlayerCommand("getCurrentTime()")
    }
    
    // MARK: Playlist controls
    
    open func previousVideo() {
       _ = evaluatePlayerCommand("previousVideo()")
    }
    
    open func nextVideo() {
        _ = evaluatePlayerCommand("nextVideo()")
    }
    
    fileprivate func evaluatePlayerCommand(_ command: String) -> String? {
        let fullCommand = "player." + command + ";"
        return webView.stringByEvaluatingJavaScript(from: fullCommand)
    }
    
    
    // MARK: Player setup
    
    fileprivate func loadWebViewWithParameters(_ parameters: [String: AnyObject]) {
        if let HTMLPath = playerHTMLPath() , let filePath = htmlStringWithFilePath(HTMLPath), let jsonParameters = serializedJSON(parameters as AnyObject) {
            let htmlString = filePath.replacingOccurrences(of: "%@", with: jsonParameters)
            webView.loadHTMLString(htmlString, baseURL: URL(string: "about:blank"))
        }
        
    }
    
    fileprivate func playerHTMLPath() -> String? {
        guard let directory = Bundle(for: self.classForCoder).path(forResource: "SwiftTube", ofType: "html") else {
            return nil
        }
        return directory
    }
    
    fileprivate func htmlStringWithFilePath(_ path: String) -> String? {
        do {
            return try String(contentsOfFile: path, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        } catch let error {
            fatalError("Error Description: (\(error)")
        }
        return nil
    }
        
    fileprivate func serializedJSON(_ object: AnyObject) -> String? {
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            
        } catch _ {
            fatalError("Fatal Error parsing JSON")
        }
        return nil
    }
    
    
    // MARK: JS Event Handling
    
    fileprivate func handleJSEvent(_ eventURL: URL) {
        
        let data: String? = eventURL.queryStringComponents()["data"] as? String
        
        if let host = eventURL.host , let event = YouTubePlayerEvents(rawValue: host) {
            
            switch event {
            case .ready:
                delegate?.playerReady(webView)
                break

            case .stateChange:
                
                if let newState = data {
//                    viewModel.state.state.
//                    delegate?.playerStateChanged(self, playerState: newState)
                }

                break

            case .playbackQualityChange:
//                if let newQuality = PlaybackQuality(rawValue: data!) {
////                    playbackQuality = newQuality
//                    delegate?.playerQualityChanged(self, playbackQuality: newQuality)
//                }

                break
            case .youTubeIframeAPIReady:
                break
            }
        }
    }
}

extension PlayerViewController: UIWebViewDelegate {
    
    open func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url
        if let url = url, url.scheme == "ytplayer" {
            handleJSEvent(url)
        }
        
        return true
    }
}

extension PlayerViewController: PlayerDelegate {
    func playerReady(_ videoPlayer: PowerWebView) {
        play()
    }
    
    func playerStateChanged(_ videoPlayer: PowerWebView, playerState: PlayerState) {
        
    }
    
    func playerQualityChanged(_ videoPlayer: PowerWebView, playbackQuality: PlayerQuality) {
        
    }
    
}


