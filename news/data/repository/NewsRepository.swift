//
//  NewsRepository.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation

protocol NewsRepository{

    func getNextWebArticles(listener: @escaping ([News]) -> Void)

    func getAssociatedPressArticles(listener: @escaping ([News]) -> Void)

    func getCachedArticles() -> [News]
}
