//
//  FeedLoader.swift
//  Feed
//
//  Created by Phai Hoang on 13/11/2023.
//

import Foundation

protocol FeedLoader {
    func load(completion: @escaping (Result<[FeedItem], Error>) -> Void)
}
