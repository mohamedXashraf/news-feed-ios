//
//  NewsAPIs.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import Foundation

class NewsAPIs {

    private let apiKey: String = "533af958594143758318137469b41ba9"

    private let newsAPIUrl: String = "https://newsapi.org/v1/"

    func getArticles(source: String, listener: @escaping ([News]) -> Void) {
        if let url = URL(string: "\(newsAPIUrl)articles?source=\(source)&apiKey=\(apiKey)"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if data != nil {
                    let response = self.handleResponse(response: data!)
                    if response != nil, response.articles != nil {
                        listener(response.articles)
                    } else {
                        listener([])
                    }
                } else {
                    print(error)
                    listener([])
                }
            }
            task.resume()
        }
    }

    private func handleResponse(response: Data) -> Response {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Response.self, from: response)
        } catch {
            print(error)
            return Response()
        }
    }
}
