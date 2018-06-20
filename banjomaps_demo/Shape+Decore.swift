//
//  Shape+Facade.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

extension Shape {
    func decore()  {
        switch type {
        case .circle:
            self.layer.cornerRadius =  self.bounds.height/2
            self.clipsToBounds = true
        case .square:
            return
        }
    }
    
    func loadColor()  {
        ConnectionManager.getColor { color in
            UIView.animate(withDuration: 0.2, animations: {
                self.backgroundColor = color ?? Constants.colors.randomItem()
            })
        }
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
