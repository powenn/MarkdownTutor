//
//  Beginner_quiz_1_View.swift
//  
//
//  Created by 蕭博文 on 2023/5/26.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Beginner_quiz_1_View:View{
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    let question_1:Multiple_Choice_Question = Multiple_Choice_Question(question: "Choose the correct description", selections: ["Markdown is easy to read only","Markdown converts HTML into plain text","Markdown wasn't inspired by pre-existing conventions","Markdown has Multi-platform support"], correctAnswer: ["cfdd4a4b585101c1dbd805014aee7c4d"])
    
    let question_2:Fixing_Up_Question = Fixing_Up_Question(md_string: """
### Heading level 3

Try to create paragraph from this line

and this line
""")
    
    @State var question_2_fixing_editArea:String = """
###Heading level 3

Try to create paragraph from this line
and this line
"""
    
    let question_3:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "Both HTML and Markdown are markup lanaguage ? (T / F)", placeholder: "*", correct_answer: "e358efa489f58062f10dd7316b65649e")
    
    
    var body: some View{
        VStack{
            ScrollView{
                Multiple_Choice_View(question: question_1)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
                Fill_In_The_Blank_View(question: question_3)
                
                Fixing_Up_View(question: question_2, editArea: $question_2_fixing_editArea)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
                
            }
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingDialog.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(BeginnerDefaults.shared.beginner_quiz_1_is_done ? Color.green:Color.gray)
                })
                .disabled(BeginnerDefaults.shared.beginner_quiz_1_is_done)
                .confirmationDialog("Please make sure you have complete this quiz", isPresented: $isShowingDialog, titleVisibility: .visible) {
                    
                    Button("I have", role: .destructive) {
                        BeginnerDefaults.shared.beginner_quiz_1_is_done.toggle()
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
