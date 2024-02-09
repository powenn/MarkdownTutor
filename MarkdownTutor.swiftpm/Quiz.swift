//
//  Quiz.swift
//  MarkdownTutor
//
//  Created by 蕭博文 on 2023/5/11.
//

import Foundation
import SwiftUI
import PopupView

enum QuizCase:String {
    
    // GettingStarted
    case what_is_markdown = "what_is_markdown"
    case why_use_markdown = "why_use_markdown"
    case how_does_it_work =  "how_does_it_work"
    case what_is_markdown_good_for = "what_is_markdown_good_for"
    
    // BasicSyntax
    case headings = "headings"
    case paragraphs = "paragraphs"
    case line_breaks = "line_breaks"
    case emphasis = "emphasis"
    case blockquotes = "blockquotes"
    case lists = "lists"
    case code = "code"
    case horizontal_rules = "horizontal_rules"
    case escaping_characters = "escaping_characters"
    
    // ExtendedSyntax
    case tables = "tables"
    case fenced_code_blocks = "fenced_code_blocks"
    case strikethrough = "strikethrough"
    case task_lists = "task_lists"
}

struct WrongAnswerNotify: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "multiply.circle")
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
            
            Text("This is not the correct answer")
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
        .padding(16)
        .background(Color.red.cornerRadius(12))
        .padding(.horizontal, 16)
        .onAppear{
            playWAMusic()
        }
    }
}


struct CorrectAnswerNotify: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
            
            Text("You got the correct answer")
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
        .padding(16)
        .background(Color.green.cornerRadius(12))
        .padding(.horizontal, 16)
        .onAppear{
            playCAMusic()
        }
    }
}

struct CongratulationNotify: View {
    let content: String
    var onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Image("Congrats")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 226, maxHeight: 226)
            Text(content)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .opacity(0.6)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
//            Button("Thanks") {
//                onClose()
//            }
//            .buttonStyle(.plain)
//            .font(.system(size: 18, weight: .bold))
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 18)
//            .padding(.horizontal, 24)
//            .foregroundColor(.white)
//            .background(Color.teal)
//            .cornerRadius(12)
            
            HStack{
                Text("Thanks")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .padding(.horizontal, 24)
                    .foregroundColor(.white)
                    .background(Color.teal)
                    .cornerRadius(12)
            }.onTapGesture {
                onClose()
            }
        }
        .padding(EdgeInsets(top: 37, leading: 24, bottom: 40, trailing: 24))
        .background(Color.white.cornerRadius(20))
        .padding(40)
        .onAppear{
            playCongratsMusic()
        }
    }
}

// For Test
struct default_quizView:View {
    var caseRawValue:String
    var body:some View{
        Text("\(caseRawValue)")
    }
}

#Preview(body: {
    CongratulationNotify(content: "Test", onClose: {
        print("closed")
    })
})
