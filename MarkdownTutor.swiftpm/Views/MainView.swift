//
//  MainView.swift
//  
//
//  Created by 蕭博文 on 2023/5/11.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "book.fill")
                }
            PlaygroundsView()
                .tabItem{
                    Label("Playground",systemImage: "square.and.pencil")
                }
            OthersView()
                .tabItem {
                    Label("Others", systemImage: "ellipsis")
                }
        }
    }
}
