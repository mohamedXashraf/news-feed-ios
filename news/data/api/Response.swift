//
//  Response.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation

struct Response: Hashable, Decodable {
    var status: String? = ""
    var source: String? = ""
    var sortBy: String? = ""
    var articles: [News] = []
}
