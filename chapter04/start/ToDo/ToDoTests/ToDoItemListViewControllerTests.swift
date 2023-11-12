//
//  ToDoItemListViewControllerTests.swift
//  ToDoTests
//
//  Created by 김완기C/SGS 모바일개발팀 on 2023/11/12.
//

import XCTest
@testable import ToDo

final class ToDoItemListViewControllerTests: XCTestCase {
    
    var toDoItemStoreMock: ToDoItemStoreProtocolMock!
    var sut: ToDoItemsListViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
        
        toDoItemStoreMock = ToDoItemStoreProtocolMock()
        sut.toDoItemStore = toDoItemStoreMock
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_shouldBeSetup() {
        XCTAssertNotNil(sut)
    }
    
    func test_shouldHaveTableView() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
    }
    
    func test_numberOfRows_whenOneItemIsSent_shouldReturnOne() {
        toDoItemStoreMock.itemPublisher.send([ToDoItem(title: "dummy 1")])
        
        let result = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(result, 1)
    }
    
    
}
