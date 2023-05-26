//
//  line_breaks_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/18.
//

import Foundation
import SwiftUI
import MarkdownUI

struct line_breaks_quizView:View {
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "We can use two or more _ for line breaks", placeholder: "******", correct_answer: "717e5e6763efa99e70c9069f3e621fcb")
    
    let question_2:Editing_Question = Editing_Question(md_string: """
This is the first line  
This is the second line
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Editing_View(question: question_2)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
//            Spacer()
//            Button(action: {
//                isShowingDialog.toggle()
//            }, label: {
//                Text(Defaults.shared.line_breaks_is_done ? "Done":"Mark As Done")
//            })
//            .disabled(Defaults.shared.line_breaks_is_done)
//            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.line_breaks_is_done))
//            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                Button("I have answered them", role: .destructive) {
//                    Defaults.shared.line_breaks_is_done.toggle()
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
                            .foregroundColor(Defaults.shared.line_breaks_is_done ? Color.green:Color.gray)
                    })
                    .disabled(Defaults.shared.line_breaks_is_done)
                    .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                        
                        Button("I have answered them", role: .destructive) {
                            Defaults.shared.line_breaks_is_done.toggle()
                            isShowingCongrats.toggle()
                        }
                        Button("I haven't", role: .cancel) {
                        }
                    }
                }
            })
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to create a line break", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
