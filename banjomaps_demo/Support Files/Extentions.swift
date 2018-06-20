//
//  Extentions.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
