//
//  CodableStructs.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

struct ColorPatern: Codable {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
}
struct ImageLink: Codable {
    var imageUrl: String
    var url: URL? {
        return URL(string: imageUrl)
    }
}
struct LoadedColor: Codable {
    var rgb: ColorPatern
    func toColor() -> UIColor {
        return UIColor(red: rgb.red/255, green: rgb.green/255, blue: rgb.blue/255, alpha: 1)
    }
}
