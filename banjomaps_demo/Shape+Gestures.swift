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
    private func addGestures()  {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func tapped()  {
        print("tapped")
    }
}
