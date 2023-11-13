//
//  ToDoItem.swift
//  ToDo
//
//  Created by WANKI KIM on 2023/11/08.
//

import Foundation
import Combine

struct ToDoItem: Equatable {
    let id = UUID()
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    var done = false
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: TimeInterval? = nil,
         location: Location? = nil) {
        
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.title == rhs.title
    }
}

extension ToDoItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
