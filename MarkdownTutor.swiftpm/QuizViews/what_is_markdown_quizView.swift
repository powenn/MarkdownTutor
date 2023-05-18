//
//  what_is_markdown_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/15.
//

import Foundation
import SwiftUI


struct what_is_markdown_quizView:View {
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "What is Markdown?", placeholder: "* *********** ****** ********", correct_answer: "cae6fd6af236a12dfdce6146fb65cb98")
    
    let question_2:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "Markdown syntax is designed to be ? (two adjectives)", placeholder: "********,***********", correct_answer: "4993d0be807fb9103fdeec1c8b21ba52")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Fill_In_The_Blank_View(question: question_2)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.what_is_markdown_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.what_is_markdown_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.what_is_markdown_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.what_is_markdown_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should have basic knowledge about Markdown ", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
