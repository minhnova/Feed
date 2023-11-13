//
//  RemoteFeedLoaderTests.swift
//  FeedTests
//
//  Created by Phai Hoang on 13/11/2023.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class RemoteFeedLoaderTests: XCTest {

    func test_init_doesNotRequestDataFromURL() {

        let url = URL(string: "https://a-given-url.com")!
        let (_, client) = makeSUT()

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {

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
