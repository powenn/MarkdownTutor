//
//  BeginnerData.swift
//  
//
//  Created by 蕭博文 on 2023/5/23.
//

import Foundation
import SwiftUI


class BeginnerDefaults: ObservableObject {
    public static let shared = BeginnerDefaults()
    
    @AppStorage(Lesson.intro.rawValue) public var intro_is_done = false
    @AppStorage(Lesson.lesson1.rawValue) public var lesson_1_is_done = false
    @AppStorage(Lesson.lesson2.rawValue) public var lesson_2_is_done = false
    @AppStorage(Lesson.lesson3.rawValue) public var lesson_3_is_done = false
    @AppStorage(Lesson.lesson4.rawValue) public var lesson_4_is_done = false
    
    
    func getDefaults(l:Lesson) -> Bool {
        switch l {
        case .intro:
            return intro_is_done
        case .lesson1:
            return lesson_1_is_done
        case .lesson2:
            return lesson_2_is_done
        case .lesson3:
            return lesson_3_is_done
        case .lesson4:
            return lesson_4_is_done
        }
    }
}
