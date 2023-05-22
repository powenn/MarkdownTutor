//
//  Lessons.swift
//  
//
//  Created by 蕭博文 on 2023/5/22.
//

import Foundation
import SwiftUI

enum Lesson:String {
    case intro = "Intro"
    case lesson1 = "Lesson 1"
    case lesson2 = "Lesson 2"
    case lesson3 = "Lesson 3"
    case lesson4 = "Lesson 4"
}

struct Intro_View:View{
    var body: some View{
        VStack{
            Text("Intro to markdown")
        }
    }
}

struct Lesson_1_View:View{
    var body: some View{
        VStack{
            Text("1")
        }
    }
}

struct Lesson_2_View:View{
    var body: some View{
        VStack{
            Text("2")
        }
    }
}

struct Lesson_3_View:View{
    var body: some View{
        VStack{
            Text("3")
        }
    }
}

struct Lesson_4_View:View{
    var body: some View{
        VStack{
            Text("4")
        }
    }
}