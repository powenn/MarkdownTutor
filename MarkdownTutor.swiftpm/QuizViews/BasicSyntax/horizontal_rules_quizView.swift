//
//  horizontal_rules_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct horizontal_rules_quizView:View {
    
    let question_1:Fixing_Up_Question = Fixing_Up_Question(md_string: """
line 1

---

line2 aftrer a horizontal rule
""")
    
    @State var question_1_fixing_editArea:String = """
line 1
---
line2 aftrer a horizontal rule
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fixing_Up_View(question: question_1, editArea: $question_1_fixing_editArea).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
//            Spacer()
//            Button(action: {
//                isShowingDialog.toggle()
//            }, label: {
//                Text(Defaults.shared.horizontal_rules_is_done ? "Done":"Mark As Done")
//            })
//            .disabled(Defaults.shared.horizontal_rules_is_done)
//            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.horizontal_rules_is_done))
//            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                Button("I have answered them", role: .destructive) {
//                    Defaults.shared.horizontal_rules_is_done.toggle()
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
                            .foregroundColor(Defaults.shared.horizontal_rules_is_done ? Color.green:Color.gray)
                    })
                    .disabled(Defaults.shared.horizontal_rules_is_done)
                    .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                        
                        Button("I have answered them", role: .destructive) {
                            Defaults.shared.horizontal_rules_is_done.toggle()
                            isShowingCongrats.toggle()
                        }
                        Button("I haven't", role: .cancel) {
                        }
                    }
                }
            })
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to denote a word or phrase as code", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
