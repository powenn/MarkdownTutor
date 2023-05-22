//
//  LearnView.swift
//  
//
//  Created by 蕭博文 on 2023/5/11.
//

import SwiftUI
import MarkdownUI

struct LearnView: View {
    @State private var selectedChapter: Chapter?
    @State private var selectedParagraph: Paragraph?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var isLoadingData = false
    @State private var mdContent:String = ""
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(ChaptersData, selection: $selectedChapter) { ch in
                NavigationLink(value: ch) {
                    Text(ch.title)
                        .font(.headline)
                }
            }.navigationTitle("Chapters")
        } content: {
            List(selectedChapter?.paragraphs ?? [], selection: $selectedParagraph) { pa in
                NavigationLink(value: pa) {
                    HStack {
                        Text(pa.title)
                            .font(.body)
                        Spacer()
                        if (pa.hasQuiz) {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(getDefaults(p: pa) ? Color.green : Color.gray)
                        }
                    }
                }
            }.navigationTitle("Paragraphs")
        } detail: {
            TabView() {
                ScrollView{
                    VStack{
                        Markdown(selectedParagraph?.text ?? "# Click the button on top left to choose content to read").markdownTheme(.gitHub)
                    }.padding()
                }
                if (selectedParagraph?.hasQuiz ?? false){
                    QuizView(quiz_case: (selectedParagraph?.quizCase)!)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationTitle(selectedParagraph?.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationSplitViewStyle(.prominentDetail)
    }
}

