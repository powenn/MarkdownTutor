//
//  emphasis_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/18.
//

import Foundation
import SwiftUI
import MarkdownUI

struct emphasis_quizView:View {
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "We can add two asterisks without spaces around the letters to bold the middle of a word for emphasis ? (T / F)", placeholder: "*", correct_answer: "e358efa489f58062f10dd7316b65649e")
    
    let question_2:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "We can add one asterisk before and after a word or phrase to italicize text ? (T / F)", placeholder: "*", correct_answer: "e358efa489f58062f10dd7316b65649e")
    
    
    let question_3:Editing_Question = Editing_Question(md_string: """
This is **bold**<br>
This is *italic*<br>
This is ***bold and italic***
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Fill_In_The_Blank_View(question: question_2)
                Editing_View(question: question_3)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
//            Spacer()
//            Button(action: {
//                isShowingDialog.toggle()
//            }, label: {
//                Text(Defaults.shared.emphasis_is_done ? "Done":"Mark As Done")
//            })
//            .disabled(Defaults.shared.emphasis_is_done)
//            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.emphasis_is_done))
//            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                Button("I have answered them", role: .destructive) {
//                    Defaults.shared.emphasis_is_done.toggle()
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
                            .foregroundColor(Defaults.shared.emphasis_is_done ? Color.green:Color.gray)
                    })
                    .disabled(Defaults.shared.emphasis_is_done)
                    .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                        
                        Button("I have answered them", role: .destructive) {
                            Defaults.shared.emphasis_is_done.toggle()
                            isShowingCongrats.toggle()
                        }
                        Button("I haven't", role: .cancel) {
                        }
                    }
                }
            })
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to add emphasis by making text bold or italic", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
