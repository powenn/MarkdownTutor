//
//  blockquotes_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/18.
//

import Foundation
import SwiftUI
import MarkdownUI

struct blockquotes_quizView:View {
    let question_1:Multiple_Choice_Question = Multiple_Choice_Question(question: "What to add in front of a paragraph to create a blockquote ? ", selections: ["-","+","-","*",">","<","="], correctAnswer: ["cedf8da05466bb54708268b3c694a78f"])
    
    let question_2:Editing_Question = Editing_Question(md_string: """
>  The first paragraph
>
> The second paragraph
>
>> nested paragraph
""")
    
    let question_3:Editing_Question = Editing_Question(md_string: """
### Heading outside
> ### Heading inside
> - item 1
> - **bold item**
>> nested paragraph

paragraph outside
""")
    
    let question_4:Fixing_Up_Question = Fixing_Up_Question(md_string: """
First line

> A blockquote

Last line
""")
    
    @State var question_4_fixing_editArea:String = """
First line
> A blockquote
Last line
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Multiple_Choice_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 450)
                Editing_View(question: question_2)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
                Editing_View(question: question_3)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 450)
                Fixing_Up_View(question: question_4, editArea: $question_4_fixing_editArea)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
//            Spacer()
//            Button(action: {
//                isShowingDialog.toggle()
//            }, label: {
//                Text(Defaults.shared.blockquotes_is_done ? "Done":"Mark As Done")
//            })
//            .disabled(Defaults.shared.blockquotes_is_done)
//            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.blockquotes_is_done))
//            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                Button("I have answered them", role: .destructive) {
//                    Defaults.shared.blockquotes_is_done.toggle()
//                    isShowingCongrats.toggle()
//                }
//                Button("I haven't", role: .cancel) {
//                }
//            }
//            Spacer(minLength: 50)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingDialog.toggle()
                    }, label: {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Defaults.shared.blockquotes_is_done ? Color.green:Color.gray)
                    })
                    .disabled(Defaults.shared.blockquotes_is_done)
                    .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                        
                        Button("I have answered them", role: .destructive) {
                            Defaults.shared.blockquotes_is_done.toggle()
                            isShowingCongrats.toggle()
                        }
                        Button("I haven't", role: .cancel) {
                        }
                    }
                }
            })
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to create a blockquote", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
