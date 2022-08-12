//
//  HomeView.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.news, id: \.id) { article in
                NavigationLink {
                    DetailsView(article: article)
                } label: {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: article.urlToImage ?? ""), content: { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable().aspectRatio(contentMode: .fill).frame(maxHeight: 300).cornerRadius(10)
                            default:
                                Spacer()
                            }
                        })
                        Text(article.title ?? "").font(.body).fontWeight(.bold).foregroundColor(Color.black)
                        Text("By \(article.author ?? "")").font(.footnote).foregroundColor(Color.black)
                    }.padding()
                }
            }.navigationTitle("News Feed").frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .top
            ).onAppear {
                viewModel.getAllArticles()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
