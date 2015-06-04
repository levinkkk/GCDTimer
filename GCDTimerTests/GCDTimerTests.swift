//
//  GCDTimerTests.swift
//  GCDTimerTests
//
//  Created by Hemanta Sapkota on 4/06/2015.
//  Copyright (c) 2015 Hemanta Sapkota. All rights reserved.
//

import UIKit
import XCTest

class GCDTimerTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTimer() {
        var timer = GCDTimer(intervalInSecs: 1)
        
        var index = 0
        timer.Event = {
            println("Hello \(index++)")
        }
        
        timer.start()
        
        NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 10))
        
        XCTAssert(index > 10, "Event should have run for at least 10 seconds.")
    }
    
    func testAutofinishingTimer() {
        var timer = GCDTimer(intervalInSecs: 1)
        
        var index = 0
        timer.Event = {
            println("Timer is running: \(index++)")
            if index == 10 {
                timer.pause()
                index = 0
            }
        }
        
        timer.start()
        
        NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 10))
        
        XCTAssert(index == 0, "Timer should have paused.")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}