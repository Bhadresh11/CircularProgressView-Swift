//
//  ViewController.swift
//  CircularProgressView
//
//  Created by iOS on 11/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewContainerProgress: UIView!
  
    var progress:Float = 0.0
    
    lazy var viewProgress:CircularProgressView = {
        let view = CircularProgressView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewContainerProgress.addSubview(viewProgress)
      Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        viewProgress.center = CGPoint(x: viewContainerProgress.frame.size.width  / 2,
                                     y: viewContainerProgress.frame.size.height / 2)
    }
    @objc func fireTimer() {
        if progress > 1 {
            progress = 0.0
        }
        progress += 0.05
        
        viewProgress.setProgress(duration: 1, to: progress)
    }
}

