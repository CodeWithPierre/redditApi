//
//  RedditModel.swift
//  RedditApi
//
//  Created by Pierre ILYAMUKURU on 10/23/21.
//

import Foundation

struct RedditModel: Codable {
    let data : RedditModelData?
}

struct RedditModelData: Codable {
    let children: [RedditModelChildren]?
}

struct RedditModelChildren: Codable {
    let kind : String?
    let data: RedditModelChildrenData?
}

struct RedditModelChildrenData: Codable {
    let title: String?
    let score: Int?
    let thumbnail:String?
    let num_comments: Int?
    let thumbnail_width: Int?
    let thumbnail_height: Int?
}

