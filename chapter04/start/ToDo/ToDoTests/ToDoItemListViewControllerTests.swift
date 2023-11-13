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
    
    // this implementation이 잘못됐다는 느낌은 우리는 우리의 구현을 올바르게 하기 위한 다른 테스트를 구현해야함을 의미한다.
    func test_numberOfRows_whenOneItemIsSent_shouldReturnOne() {
        toDoItemStoreMock.itemPublisher.send([ToDoItem(title: "dummy 1")])
        
        let result = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_numberOfRows_whenTwoItemsAreSent_shouldReturnTwo() {
        toDoItemStoreMock.itemPublisher
            .send([ToDoItem(title: "dummy 1"),
                   ToDoItem(title: "dummy 2")])
        
        let result = sut.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_cellForRowAt_shouldReturnCellWithTitle1() throws {
        let titleUnderTest = "dummy 1"
        toDoItemStoreMock.itemPublisher
            .send([ToDoItem(title: titleUnderTest)])
        
        let tableView = try XCTUnwrap(sut.tableView)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell)
        
        XCTAssertEqual(cell.titleLabel.text, titleUnderTest)
    }
    
    func test_cellForRowAt_shouldReturnCellWithTitle2() throws {
        let titleUnderTest = "dummy 2"
        toDoItemStoreMock.itemPublisher
            .send([ToDoItem(title: "dummy 1"),
                  ToDoItem(title: titleUnderTest)])
        
        let tableView = try XCTUnwrap(sut.tableView)
        
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = try XCTUnwrap(tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell)
        
        XCTAssertEqual(cell.titleLabel.text, titleUnderTest)
    }
    
    func test_cellForRowAt_shouldReturnCellWithDate() throws {
        let date = Date()
        toDoItemStoreMock.itemPublisher
            .send([
                ToDoItem(title: "dummy 1",
                         timestamp: date.timeIntervalSince1970)
            ])
        
        let tableView = try XCTUnwrap(sut.tableView)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell)
        
        XCTAssertEqual(cell.dateLabel.text, sut.dateFormatter.string(from: date))
        
    }
}
