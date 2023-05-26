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
    let lessons:[Lesson] = [.intro,.lesson1,.lesson2,.lesson3,.beginner_quiz_1]
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
                            .font(.headline)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
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
        case .beginner_quiz_1:
            Beginner_quiz_1_View()
        }
    }
}
