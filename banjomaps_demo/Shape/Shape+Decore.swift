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
            self.loadColor()
        case .square:
            self.loadImage()
        }
    }
    
    func loadImage()  {
        ConnectionManager.downloadSampleImage { img in
            self.image = img
            if img == nil {
                print("WTF?")
                self.animateToColor()
            }
        }
    }
    
    func loadColor()  {
        ConnectionManager.getColor {self.animateToColor($0)}
    }
    
    func animateToColor(_ color: UIColor? = nil){
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = color ?? Constants.colors.randomItem()
        })
    }
}
