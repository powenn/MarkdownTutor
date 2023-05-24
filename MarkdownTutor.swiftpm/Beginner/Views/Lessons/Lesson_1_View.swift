//
//  Lesson_1_View.swift
//  
//
//  Created by 蕭博文 on 2023/5/24.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Lesson_1_View:View{
    
    let tut:String = """
# Lesson 1
> In this lesson, you will learn how to create heading and paragraphs.

- Heading
- Paragraph
---

## Heading

To create a heading, add number signs (#) in front of a word or phrase. The number of number signs you use should correspond to the heading level.
> You can adjust the number of signs to see the rendered output.
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body: some View{
        VStack{
            ScrollView{
                Markdown(tut).markdownTheme(.gitHub)
                    .padding()
                Lesson_1_HeadingView()
            }
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingDialog.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(BeginnerDefaults.shared.lesson_1_is_done ? Color.green:Color.gray)
                })
                .disabled(BeginnerDefaults.shared.lesson_1_is_done)
                .confirmationDialog("Please make sure you have read and understand this lesson", isPresented: $isShowingDialog, titleVisibility: .visible) {
                    
                    Button("I have", role: .destructive) {
                        BeginnerDefaults.shared.lesson_1_is_done.toggle()
                        isShowingCongrats.toggle()
                    }
                    Button("I haven't", role: .cancel) {
                    }
                }
            }
        })
        .popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this lesson", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}

struct Lesson_1_HeadingView:View{
    @State var number = 3
    var body: some View{
        VStack(alignment: .leading){
            Stepper("Number of number signs (#)", value: $number,in: 0...6)
                .font(.headline)
            Text("\(String.init(repeating: "#", count: number)) Heading Level \(number)")
                .font(.body)
                .padding()
                .border(.primary)
            Text("Rendered Output")
                .font(.headline)
            Markdown("""
\(String.init(repeating: "#", count: number)) Heading Level \(number)
""")
            .markdownTheme(.gitHub)
            .padding()
            .border(.primary)
        }.padding()
    }
}
