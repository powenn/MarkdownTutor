//
//  strikethrough_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct strikethrough_quizView:View {
    
    let question_1:Multiple_Choice_Question = Multiple_Choice_Question(question: "What we use on the lines before and after the code block ?", selections: ["\\\\","^^","$$","//","!!","@@","~~","%%"], correctAnswer: ["41cd24d3b9463581c00f2604473a769c"])
    
    let question_2:Editing_Question = Editing_Question(md_string: """
~~Today is 5/18~~ Sorry it is 5/19
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Multiple_Choice_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 500)
                Editing_View(question: question_2).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 250)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.strikethrough_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.strikethrough_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.strikethrough_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.strikethrough_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to strikethrough words", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
