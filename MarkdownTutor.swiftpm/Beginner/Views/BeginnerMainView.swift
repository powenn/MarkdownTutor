//
//  BeginnerMainView.swift
//  
//
//  Created by 蕭博文 on 2023/5/11.
//

import SwiftUI

struct BeginnerMainView: View {
    var body: some View {
        TabView{
            BeginnerLearnView()
                .tabItem {
                    Label("Learn", systemImage: "book.fill")
                }
            OthersView()
                .tabItem {
                    Label("Others", systemImage: "ellipsis")
                }
        }
    }
}
