//
//  BeginnerLearnView.swift
//  
//
//  Created by 蕭博文 on 2023/5/11.
//

import SwiftUI
import MarkdownUI

struct BeginnerLearnView: View {
    @ObservedObject var beginnerdefaults = BeginnerDefaults()
    let lessons:[Lesson] = [.intro,.lesson1,.lesson2,.lesson3,.lesson4]
    var body: some View {
        
        NavigationStack {
            List(lessons, id: \.self) { lesson in
                NavigationLink {
                    beginnerlearnView(lesson: lesson)
                        .navigationTitle(lesson.rawValue)
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    HStack {
                        Text(lesson.rawValue)
                        Spacer()
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(beginnerdefaults.getDefaults(l: lesson) ? Color.green : Color.gray)
                        
                    }
                }
                .font(.headline)
            }
            .navigationTitle("Lessons")
        }
    }
}

struct beginnerlearnView:View{
    var lesson:Lesson
    var body: some View{
        switch lesson {
        case .intro:
            Intro_View()
        case .lesson1 :
            Lesson_1_View()
        case .lesson2:
            Lesson_2_View()
        case .lesson3:
            Lesson_3_View()
        case .lesson4:
            Lesson_4_View()
        }
    }
}
