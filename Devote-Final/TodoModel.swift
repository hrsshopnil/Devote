//
//  Model.swift
//  Devote-Final
//
//  Created by shopnil hasan on 9/6/24.
//

import SwiftUI
import SwiftData

@Model
class Tasks {
    var task: String
    var completion: Bool = false
    var date: Date = Date.now
    
    init(task: String) {
        self.task = task
    }
}
