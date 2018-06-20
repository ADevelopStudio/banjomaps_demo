//
//  Shape.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class Shape: UIImageView {
    var type = TypeOfShape.allValues.randomItem() ?? .square
    
    init(){
        let ranromSize = Int(arc4random_uniform(UInt32(100))+30)
        super.init(frame:  CGRect(x: 0, y: 0, width: ranromSize, height: ranromSize))
        self.backgroundColor = UIColor.groupTableViewBackground
        self.decore()
        self.addGestures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
