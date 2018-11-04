//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by tarek on 01/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsViewModel() {
        let info = News(newsId: 1, newsTitle: "News Test Title", newsSubTitle: "Testing", newsOriImage: "ImageURL", newsThumbImage: "Image thumb", newsShortDesc: "Short description", newsBody: "News Body text", newsUrl: "news URL website")
        let newsViewModel = NewsViewModel(info: info)
        
        XCTAssertEqual(info.newsTitle, newsViewModel.title)
        XCTAssertEqual(info.newsShortDesc, newsViewModel.description)
        
    }
    
    func testNewsViewModelTitleOverThreshold() {
        let info = News(newsId: 1, newsTitle: "eSport: 20.000 Menschen in Hamburg", newsSubTitle: "Testing", newsOriImage: "ImageURL", newsThumbImage: "Image thumb", newsShortDesc: "Short description", newsBody: "News Body text", newsUrl: "news URL website")
        let newsViewModel = NewsViewModel(info: info)

        XCTAssertEqual("eSport: 20.000 Menschen in Hamburg", newsViewModel.title)
    }
    
}
