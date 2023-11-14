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
        let (_, client) = makeSUT(url: url)

        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestsDataFromURL() {

        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()
        
        XCTAssertNotNil(client.requestedURLs)
    }
    
    func test_loadTwice_requestsDataFromURL() {

        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
   
    // MARK: Helpers

    private func makeSUT(url: URL = URL(string: "https://a-given-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client, url: url)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        
        var requestedURLs = [URL]()
        func get(from url: URL) {
            requestedURLs.append(url)
        }
    }
}
