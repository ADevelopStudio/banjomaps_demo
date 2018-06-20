//
//  ViewController.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createShape(_ sender: UITapGestureRecognizer) {
        let view1 = self.generateView()
        view1.center = sender.location(in: self.view)
        self.view.addSubview(view1)
    }
    
    func generateView() -> UIView {
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        redView.backgroundColor = .red
        return redView
    }
}

