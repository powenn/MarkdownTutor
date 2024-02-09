//
//  Beginner_quiz_2_View.swift
//  
//
//  Created by 蕭博文 on 2023/5/26.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Beginner_quiz_2_View:View{
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    
    let question_1:Fixing_Up_Question = Fixing_Up_Question(md_string: """
Try to bold **this**‎<br>
Try to italicize *this*<br>
Can you guess how to make ***this***<br>

Also works for heading like this

## *Heading*
""")
    
    @State var question_1_fixing_editArea:String = """
Try to bold this<br>
Try to italicize this<br>
Can you guess how to make this<br>

Also works for heading like this

## Heading
"""
    
    let question_2:Fixing_Up_Question = Fixing_Up_Question(md_string: """
> Can you guess how to create a multiple paragraphs blockquotes
>
> p1
>
> p2
""")
    
    @State var question_2_fixing_editArea:String = """
> Can you guess how to create a multiple paragraphs blockquotes
>
> p1
> p2
"""
    
    let question_3:Fixing_Up_Question = Fixing_Up_Question(md_string: """
1. item 1
2. item 2
3. `item 3`
""")
    
    @State var question_3_fixing_editArea:String = """
3. item 1
2. item 2
3. item 3
"""
    
    
    var body: some View{
        VStack{
            ScrollView{
                Fixing_Up_View(question: question_1, editArea: $question_1_fixing_editArea)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 450)
                Fixing_Up_View(question: question_2, editArea: $question_2_fixing_editArea)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
                Fixing_Up_View(question: question_3, editArea: $question_3_fixing_editArea)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingDialog.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(BeginnerDefaults.shared.beginner_quiz_2_is_done ? Color.green:Color.gray)
                })
                .disabled(BeginnerDefaults.shared.beginner_quiz_2_is_done)
                .confirmationDialog("Please make sure you have complete this quiz", isPresented: $isShowingDialog, titleVisibility: .visible) {
                    
                    Button("I have", role: .destructive) {
                        BeginnerDefaults.shared.beginner_quiz_2_is_done.toggle()
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
