//
//  GetAllArticles.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation


class GetAllArticles {
    
    private let repository: NewsRepository = NewsRepositoryImplementation()
    
    func run(listener: @escaping ([News]) -> Void) {
        var articles: [News] = []
        repository.getNextWebArticles { nextWebArticles in
            articles.append(contentsOf: nextWebArticles)
            self.repository.getAssociatedPressArticles { associatedPressArticles in
                articles.append(contentsOf: associatedPressArticles)
                listener(articles)
            }
        }
    }
}
