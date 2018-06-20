//
//  ViewController.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func createShape(_ sender: UITapGestureRecognizer) {
        let shape = Shape()
        shape.center = sender.location(in: self.view)
        self.view.addSubview(shape)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.view.subviews.forEach({$0.removeFromSuperview()})
        }
    }
}

