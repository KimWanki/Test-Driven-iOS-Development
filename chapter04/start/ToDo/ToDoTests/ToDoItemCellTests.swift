//
//  ToDoItemCellTests.swift
//  ToDoTests
//
//  Created by WANKI KIM on 2023/11/13.
//

import XCTest
@testable import ToDo

final class ToDoItemCellTests: XCTestCase {

    var sut: ToDoItemCell!
    
    override func setUpWithError() throws {
        sut = ToDoItemCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_hasTitleLabelSubview() {
        let subView = sut.titleLabel
        XCTAssertTrue(subView.isDescendant(of: sut.contentView))
    }
    
    func test_hasDataLabelSubview() {
        let subView = sut.dateLabel
        XCTAssertTrue(subView.isDescendant(of: sut.contentView))
    }
    
    func test_hasLocationLabelSubview() {
        let subView = sut.locationLabel
        XCTAssertTrue(subView.isDescendant(of: sut.contentView))
    }
    
}
