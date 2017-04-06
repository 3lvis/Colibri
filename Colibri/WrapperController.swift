import UIKit

class WrapperController: UIViewController {
    lazy var wrapperView: WrapperView = {
        var frame = UIScreen.main.bounds
        let statusBar = CGFloat(20)
        frame.origin.y = statusBar
        frame.size.height -= statusBar
        let view = WrapperView(frame: frame)
        view.viewDelegate = self

        return view
    }()

    let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.wrapperView)
        self.view.backgroundColor = .white

        let request = URLRequest(url: URL(string: self.baseURL)!)
        self.wrapperView.webView.load(request)
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
}

extension WrapperController: WrapperViewDelegate {
    func wrapperView(_ wrapperView: WrapperView, didChangeURL url: String) {
        print(url)
    }
}
