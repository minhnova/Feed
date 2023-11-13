//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//  Created by Phai Hoang on 13/11/2023.
//

import XCTest

class RemoteFeedLoader {
    
}
class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTest {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }
}
