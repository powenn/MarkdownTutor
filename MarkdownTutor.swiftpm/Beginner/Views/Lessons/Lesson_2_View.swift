//
//  Lesson_2_View.swift
//  
//
//  Created by 蕭博文 on 2023/5/24.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Lesson_2_View:View{
    
    
    let tut:String = """
# Lesson 2
> In this lesson, you will learn how to add emphasis and create a blockquote.

- Emphasis
- Blockquote
---

## Emphasis

### Bold

Add two asterisks or underscores before and after a word or phrase.

For Example :<br>
\\*\\*Bold\\*\\*

### Italic

Add one asterisk or underscore before and after a word or phrase.

For Example :<br>
\\*Italic\\*

> You can adjust the number of asterisks to see the rendered output of different number of number asterisks.
"""
    

    
    let tut2:String = """
---

## Blockquotes

Add a > in front of a paragraph to create a blockquote.

For example :<br>
`> A line in blocakquote`

The rendered output looks like this:
> A line in blocakquote
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body: some View{
        VStack{
            ScrollView{
                Markdown(tut).markdownTheme(.gitHub)
                    .padding()
                Lesson_2_EmphasisView()
                Markdown(tut2).markdownTheme(.gitHub)
                    .padding()
            }
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingDialog.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(BeginnerDefaults.shared.lesson_2_is_done ? Color.green:Color.gray)
                })
                .disabled(BeginnerDefaults.shared.lesson_2_is_done)
                .confirmationDialog("Please make sure you have read and understand this lesson", isPresented: $isShowingDialog, titleVisibility: .visible) {
                    
                    Button("I have", role: .destructive) {
                        BeginnerDefaults.shared.lesson_2_is_done.toggle()
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


struct Lesson_2_EmphasisView:View{
    @State var number = 0
    var body: some View{
        VStack(alignment: .leading){
            Stepper("Number of number asterisks", value: $number,in: 0...3)
                .font(.headline)
            Text("\(String.init(repeating: "*", count: number))Text\(String.init(repeating: "*", count: number))")
                .font(.body)
                .padding()
                .border(.primary)
            Text("Rendered Output")
                .font(.headline)
            Markdown("""
\(String.init(repeating: "*", count: number))Text\(String.init(repeating: "*", count: number))
""")
            .markdownTheme(.gitHub)
            .padding()
            .border(.primary)
        }.padding()
    }
}
