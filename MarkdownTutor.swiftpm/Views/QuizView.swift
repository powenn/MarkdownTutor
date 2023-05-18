//
//  QuizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/11.
//

import SwiftUI

struct QuizView: View {
    var quiz_case:QuizCase
    var body: some View {
        switch quiz_case {
        case .what_is_markdown:
            what_is_markdown_quizView()
        case .why_use_markdown:
            why_use_markdown_quizView()
        case .how_does_it_work :
            how_does_it_work_quizView()
        case .what_is_markdown_good_for:
            what_is_markdown_good_for_quizView()
        case .headings:
            headings_quizView()
        case .paragraphs:
            paragraphs_quizView()
        default :
            default_quizView(caseRawValue: quiz_case.rawValue)
        }
    }
}


