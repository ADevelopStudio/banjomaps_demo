//
//  Shape+Gestures.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import  UIKit

extension Shape {
    func addGestures()  {
        self.isMultipleTouchEnabled = true
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action:nil)) //To Override superview's  UITapGestureRecognizer
        let doubleTap  = UITapGestureRecognizer(target: self, action:  #selector(self.doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTap)
    }
    
    @objc private func doubleTapped()  {
        self.image = nil
        self.loadColor()
    }
}
