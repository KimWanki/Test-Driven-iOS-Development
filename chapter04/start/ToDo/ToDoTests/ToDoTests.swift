//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by WANKI KIM on 2023/11/07.
//

import XCTest
// testable keyword는 TODO의 internal methods에 접근 가능하도록 해줌.
@testable import ToDo

final class ToDoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_takesTitle() {
        _ = ToDoItem(title: "Dummy")
    }
    
    func test_init_takesTitleAndDescription() {
        _ = ToDoItem(title: "Dummy", itemDescription: "Dummy Description")
    }
    
    func test_init_whenGivenTitle_setsTitle() { // test method는 test_로 시작해야함.
        let item = ToDoItem(title: "Dummy")
        XCTAssertEqual(item.title, "Dummy")
    }
    
    func test_init_whenGivenDescription_setsDescription() {
        let item = ToDoItem(title: "Dummy",
                            itemDescription: "Dummy Description")
        XCTAssertEqual(item.itemDescription, "Dummy Description")
    }
    
    // 테스트 코드에서 force unwrapping을 사용하는 것은 괜찮으나, 그럼에도 XCUnwrap 메소드를 사용하는 것이 좋음.
    func test_init_setsTimestamp() throws {
        let dummyTimeStamp: TimeInterval = 42.0
        
        let item = ToDoItem(title: "Dummy",
                            timestamp: dummyTimeStamp)
        
        let timeStamp = try XCTUnwrap(item.timestamp)
        
        XCTAssertEqual(timeStamp,
                       dummyTimeStamp,
                       accuracy: 0.000_001)
    }
    
    func test_init_whenGivenLocation_setsLocation() {
        let dummyLocation = Location(name: "Foo")
    
        let item = ToDoItem(title: "Dummy",
                            location: dummyLocation)
        
        XCTAssertEqual(item.location?.name, dummyLocation.name)
    }
}
