//
//  ToDoItemStoreProtocolMock.swift
//  ToDoTests
//
//  Created by 김완기C/SGS 모바일개발팀 on 2023/11/12.
//

import Foundation
import Combine
@testable import ToDo

class ToDoItemStoreProtocolMock: ToDoItemStoreProtocol {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    var checkLastCallArgument: ToDoItem?
    
    func check(_ item: ToDoItem) {
        checkLastCallArgument = item
    }
}
