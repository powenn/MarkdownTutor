//
//  fenced_code_blocks_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct fenced_code_blocks_quizView:View {
    
    let question_1:Multiple_Choice_Question = Multiple_Choice_Question(question: "What we use on the lines before and after the code block ?", selections: ["\\\\\\","^^^","$$$","///","!!!","@@@","```","~~~"], correctAnswer: ["3022884942eb05fa4b5034a8cf9a1fdd","102c3439d577d1d0d552b03fcae27c5e"])
    
    let question_2:Editing_Question = Editing_Question(md_string: """
```
while alive {
    breath()
}
```
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Multiple_Choice_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 500)
                Editing_View(question: question_2).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 350)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.fenced_code_blocks_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.fenced_code_blocks_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.fenced_code_blocks_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.fenced_code_blocks_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to create fenced code blocks", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
