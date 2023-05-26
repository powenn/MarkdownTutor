//
//  code_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct code_quizView:View {

    let question_1:Editing_Question = Editing_Question(md_string: """
We use `echo` command to display line of text/string that are passed as an argument in linux
""")
    
    let question_2:Editing_Question = Editing_Question(md_string: """
``Do you know how to use `code` ?``
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Editing_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 300)
                Editing_View(question: question_2).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 300)
            }
//            Spacer()
//            Button(action: {
//                isShowingDialog.toggle()
//            }, label: {
//                Text(Defaults.shared.code_is_done ? "Done":"Mark As Done")
//            })
//            .disabled(Defaults.shared.code_is_done)
//            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.code_is_done))
//            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                Button("I have answered them", role: .destructive) {
//                    Defaults.shared.code_is_done.toggle()
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
                            .foregroundColor(Defaults.shared.code_is_done ? Color.green:Color.gray)
                    })
                    .disabled(Defaults.shared.code_is_done)
                    .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                        
                        Button("I have answered them", role: .destructive) {
                            Defaults.shared.code_is_done.toggle()
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
