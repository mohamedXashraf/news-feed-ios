//
//  NewsRepositoryImplementation.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation

class NewsRepositoryImplementation: NewsRepository {
    
    private let api = NewsAPIs()
    
    private var nextWebArticles: [News] = []
    
    private var associatedPressArticles: [News] = []
    
    func getNextWebArticles(listener: @escaping ([News]) -> Void) {
        api.getArticles(source: "the-next-web", listener: { articles in
            self.nextWebArticles = articles
            listener(articles)
        })
    }

    func getAssociatedPressArticles(listener: @escaping ([News]) -> Void) {
        api.getArticles(source: "associated-press", listener: { articles in
            self.associatedPressArticles = articles
            listener(articles)
        })
    }

    func getCachedArticles() -> [News] {
        var articles: [News] = []
        articles.append(contentsOf: nextWebArticles)
        articles.append(contentsOf: associatedPressArticles)
        return articles
    }
}
