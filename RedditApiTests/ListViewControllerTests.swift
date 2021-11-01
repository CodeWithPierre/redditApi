//
//  ListViewControllerTests.swift
//  RedditApiTests
//
//  Created by Pierre ILYAMUKURU on 10/28/21.
//

import XCTest
@testable import RedditApi

class ListViewControllerTests: XCTestCase {

        var listViewController: ListViewController!
        
        override func setUp() {
            super.setUp()
            listViewController = ListViewController()
            XCTAssertNotNil(listViewController.view)
            listViewController.loadView()
        }
        
        override func tearDown() {
            listViewController = nil
            super.tearDown()
        }
        
        func testThatViewConformsToUITableViewDelegate() {
            XCTAssertTrue(listViewController.conforms(to: UITableViewDelegate.self),"view does not conform to UItable view delegate protocol")
        }
        
        func testThatViewConformsToUITableViewDataSource() {
            XCTAssertTrue(listViewController.conforms(to:UITableViewDataSource.self),"view does not conform to UItable view data source protocol")
        }
        
        func testNumberOfSectionsInTableView() {
            XCTAssertEqual(self.listViewController.listTableView.numberOfSections,1)
        }
        
        func test_outlet_shouldBeConnected() {
            listViewController.loadViewIfNeeded()
            XCTAssertNotNil(listViewController.listTableView, "Asserting tableview is connected")
        }

    }
