//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by 김완기C/SGS 모바일개발팀 on 2023/11/12.
//

import Foundation
import Combine

protocol ToDoItemStoreProtocol {
    var itemPublisher: CurrentValueSubject<[ToDoItem], Never> { get set }
    func check(_: ToDoItem)
}


class ToDoItemStore: ToDoItemStoreProtocol {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    func add(_ item: ToDoItem) {
        items.append(item)
    }
    
    func check(_: ToDoItem) {
        
    }
    
    
}
