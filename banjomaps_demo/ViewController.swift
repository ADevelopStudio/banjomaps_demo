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
        let shape = Shape()
        shape.center = sender.location(in: self.view)
        self.view.addSubview(shape)
    }

}

