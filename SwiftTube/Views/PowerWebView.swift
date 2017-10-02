//
//  PowerWebView.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 28/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import UIKit


class PowerWebView: UIWebView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    private func setupUI() {
        allowsInlineMediaPlayback = true
        mediaPlaybackRequiresUserAction = false
        scrollView.isScrollEnabled = false
    }
}
