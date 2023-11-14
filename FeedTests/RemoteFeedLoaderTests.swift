//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//  Created by Phai Hoang on 13/11/2023.
//

import XCTest
import Feed

class RemoteFeedLoaderTests: XCTest {

    func test_init_doesNotRequestDataFromURL() {

        let url = URL(string: "https://a-given-url.com")!
        let (_, client) = makeSUT()

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {

        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT()

        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
   
    // MARK: Helpers

    private func makeSUT(url: URL = URL(string: "https://a-given-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client, url: url)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {

        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
}
