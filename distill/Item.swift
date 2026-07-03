//
//  Item.swift
//  distill
//
//  Created by Vitha Watson on 03/07/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
