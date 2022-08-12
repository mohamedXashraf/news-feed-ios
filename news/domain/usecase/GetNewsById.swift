//
//  GetNewsById.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation

class GetNewsById {

    private let repository: NewsRepository = NewsRepositoryImplementation()

    func run(id: String) -> News? {
        let articles: [News] = repository.getCachedArticles()
        for article in articles {
            if article.id == id {
                return article
            }
        }
        return nil
    }
}
