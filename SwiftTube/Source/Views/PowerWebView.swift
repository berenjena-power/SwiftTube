import UIKit


public class PowerWebView: UIWebView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    private func setupUI() {
        allowsInlineMediaPlayback = true
        mediaPlaybackRequiresUserAction = false
        scrollView.isScrollEnabled = false
    }
}
