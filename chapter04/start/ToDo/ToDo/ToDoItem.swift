//
//  ToDoItem.swift
//  ToDo
//
//  Created by WANKI KIM on 2023/11/08.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: TimeInterval? = nil,
         location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}


extension ToDoItem: Equatable {
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.title == rhs.title
    }
    
    
}
