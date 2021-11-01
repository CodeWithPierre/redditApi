//
//  ListViewModelTests.swift
//  RedditApiTests
//
//  Created by Pierre ILYAMUKURU on 10/28/21.
//

import XCTest
@testable import RedditApi

class ListViewModelTests: XCTestCase {
    
        private var viewModel: ListViewModel =  ListViewModel()
        private var results = [RedditModelChildren]()

        override func setUpWithError() throws {
            createRedditsResultModel()
        }

        override func tearDownWithError() throws {
            results = []
        }

        func testGetNumberOfRowsIfNoFilteredReddits() throws {
            viewModel.reddits = results
            XCTAssertEqual(viewModel.getNumberOfRows(), 3)
        }

        
        func testGetItemForRowIfNoFilteredReddits() throws {
            viewModel.reddits = []
            viewModel.reddits = results
            guard let result = viewModel.getItemForRow(index: 0) else {
                XCTFail(" there is no result")
                return
            }
            XCTAssertEqual(result.title, "What recent trends in films do you dislike?")
            XCTAssertEqual(result.thumbnail,  "https://www.reddit.com/r/movies/comments/qhayon/what_recent_trends_in_films_do_you_dislike/")
            XCTAssertEqual(result.score, 13)
            XCTAssertEqual(result.num_comments, 500)
            XCTAssertEqual(result.thumbnail_height, 720)
            XCTAssertEqual(result.thumbnail_width, 1280)
        }
        
        func createRedditsResultModel(){
            let RedditModel1 = RedditModelChildren.init(kind: "", data: RedditModelChildrenData(title: "What recent trends in films do you dislike?", score: 13, thumbnail: "https://www.reddit.com/r/movies/comments/qhayon/what_recent_trends_in_films_do_you_dislike/", num_comments: 500, thumbnail_width: 1280, thumbnail_height: 720))
            
            let RedditModel2 = RedditModelChildren.init(kind: "", data: RedditModelChildrenData(title: "What recent trends in films do you dislike?", score: 13, thumbnail: "https://www.reddit.com/r/movies/comments/qhayon/what_recent_trends_in_films_do_you_dislike/", num_comments: 500, thumbnail_width: 1280, thumbnail_height: 720))
            
            let RedditModel3 = RedditModelChildren.init(kind: "", data: RedditModelChildrenData(title: "What recent trends in films do you dislike?", score: 13, thumbnail: "https://www.reddit.com/r/movies/comments/qhayon/what_recent_trends_in_films_do_you_dislike/", num_comments: 500, thumbnail_width: 1280, thumbnail_height: 720))
           
            results.append(RedditModel1)
            results.append(RedditModel2)
            results.append(RedditModel3)
        }

    }

