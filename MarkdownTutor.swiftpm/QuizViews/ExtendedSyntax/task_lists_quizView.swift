//
//  task_lists_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct task_lists_quizView:View {
    
    let question_1:Editing_Question = Editing_Question(md_string: """
- [X] Tutorial parts
- [ ] Quiz parts
- [ ] A simple playground
- [ ] Quick experience mode
""")
        
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Editing_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.task_lists_is_donw ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.task_lists_is_donw)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.task_lists_is_donw))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.task_lists_is_donw.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to create a list of items with checkboxes", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
