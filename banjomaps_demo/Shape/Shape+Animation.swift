//
//  Shape+Animation.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

extension Shape {
    override func removeFromSuperview() {
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.4,
                       delay: 0.01,
                       usingSpringWithDamping: CGFloat(0.8),
                       initialSpringVelocity: CGFloat(2),
                       options: .allowUserInteraction,
                       animations: {
                        self.alpha = 0
                        self.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { _ in
            super.removeFromSuperview()
            UISelectionFeedbackGenerator().selectionChanged()
        })
    }
    
    override func didMoveToSuperview() {
        self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        UIView.animate(withDuration: 0.6,
                       delay: 0.0,
                       usingSpringWithDamping: CGFloat(0.2),
                       initialSpringVelocity: CGFloat(5),
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
}
