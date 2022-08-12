//
//  News.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation

struct News: Hashable, Decodable {
    let id: String? = UUID().uuidString
    var author: String? = ""
    var title: String? = ""
    var description: String? = ""
    var url: String? = ""
    var urlToImage: String? = ""
    var publishedAt: String? = ""
}
