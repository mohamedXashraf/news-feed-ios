//
//  SplashView.swift
//  news
//
//  Created by Mohamed on 12/08/2022.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false

    var body: some View {
        if self.isActive {
            HomeView()
        } else {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 350.0, height: 350.0)
            }.padding().onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
