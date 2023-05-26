//
//  escaping_characters_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct escaping_characters_quizView:View {
    
    let question_1:Editing_Question = Editing_Question(md_string: """
\\*\\*bold\\*\\*<br>
\\*italic\\*<br>
\\# Heading level 1<br>
\\- item
""")
    
    let question_2:Fixing_Up_Question = Fixing_Up_Question(md_string: """
This is \\*\\*\\*bold and italic\\*\\*\\*<br>
\\[link\\]\\(https://example.com\\)<br>
""")
    
    @State var question_2_fixing_editArea:String = """
This is ***bold and italic***<br>
[link](https://example.com)
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Editing_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
                Fixing_Up_View(question: question_2, editArea: $question_2_fixing_editArea).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 300)
            }
//            Spacer()
//            Button(action: {
//                isShowingDialog.toggle()
//            }, label: {
//                Text(Defaults.shared.escaping_characters_is_done ? "Done":"Mark As Done")
//            })
//            .disabled(Defaults.shared.escaping_characters_is_done)
//            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.escaping_characters_is_done))
//            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                Button("I have answered them", role: .destructive) {
//                    Defaults.shared.escaping_characters_is_done.toggle()
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
                            .foregroundColor(Defaults.shared.escaping_characters_is_done ? Color.green:Color.gray)
                    })
                    .disabled(Defaults.shared.escaping_characters_is_done)
                    .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                        
                        Button("I have answered them", role: .destructive) {
                            Defaults.shared.escaping_characters_is_done.toggle()
                            isShowingCongrats.toggle()
                        }
                        Button("I haven't", role: .cancel) {
                        }
                    }
                }
            })
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to display a literal character that would otherwise be used to format text", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
