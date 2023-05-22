//
//  BeginnerLearnView.swift
//  
//
//  Created by 蕭博文 on 2023/5/11.
//

import SwiftUI
import MarkdownUI

struct BeginnerLearnView: View {
    
    let lessons:[Lesson] = [.intro,.lesson1,.lesson2,.lesson3,.lesson4]
    
    var body: some View {
        
        NavigationStack {
            List(lessons, id: \.self) { lesson in
                NavigationLink(lesson.rawValue) {
                    switch lesson {
                    case .intro:
                        Intro_View()
                            .navigationTitle(lesson.rawValue)
                            .navigationBarTitleDisplayMode(.inline)
                    case .lesson1 :
                        Lesson_1_View()
                            .navigationTitle(lesson.rawValue)
                            .navigationBarTitleDisplayMode(.inline)
                    case .lesson2:
                        Lesson_2_View()
                            .navigationTitle(lesson.rawValue)
                            .navigationBarTitleDisplayMode(.inline)
                    case .lesson3:
                        Lesson_3_View()
                            .navigationTitle(lesson.rawValue)
                            .navigationBarTitleDisplayMode(.inline)
                    case .lesson4:
                        Lesson_4_View()
                            .navigationTitle(lesson.rawValue)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }.font(.headline)
            }
            .navigationTitle("Lessons")
        }
    }
}

