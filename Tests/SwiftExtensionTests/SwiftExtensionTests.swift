//
//  SwiftExtensionTests.swift
//  SwiftExtension
//
//  Created by chansim.youk on {TODAY}.
//  Copyright © 2017 SwiftExtension. All rights reserved.
//

import Foundation
import XCTest
import SwiftExtension

class SwiftExtensionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(SwiftExtension().text, "Hello, World!")
    }
}

#if os(Linux)
extension SwiftExtensionTests {
    static var allTests : [(String, (SwiftExtensionTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
