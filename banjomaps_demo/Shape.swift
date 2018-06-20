//
//  Shape.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class Shape: UIView {
    init(){
        let ranromSize = Int(arc4random_uniform(UInt32(50))+20)
        super.init(frame:  CGRect(x: 0, y: 0, width: ranromSize, height: ranromSize))
        self.backgroundColor = Constants.colors.randomItem()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
