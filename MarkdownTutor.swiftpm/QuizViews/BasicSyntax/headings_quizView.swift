//
//  headings_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/16.
//

import Foundation
import SwiftUI
import MarkdownUI

struct headings_quizView:View {
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "The more # the bigger heading ? (T / F)", placeholder: "*", correct_answer: "8fa14cdd754f91cc6554c9e71929cce7")
    
    let question_2:Editing_Question = Editing_Question(md_string: """
# Heading level 1
## Heading level 2
### Heading level 3
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Editing_View(question: question_2)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 400)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.headings_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.headings_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.headings_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.headings_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to create headings in markdown", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
