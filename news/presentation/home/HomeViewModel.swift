//
//  HomeViewModel.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Combine

class HomeViewModel: ObservableObject {

    @Published var news: [News]

    init() {
        news = []
    }

    func getAllArticles() {
        GetAllArticles().run { articles in
            self.news = articles
        }
    }
}
