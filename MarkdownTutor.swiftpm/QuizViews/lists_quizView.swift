//
//  lists_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/18.
//

import Foundation
import SwiftUI
import MarkdownUI

struct lists_quizView:View {
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "For ordered list, the numbers have to be in numerical order and the list should start with the number one (T / F)", placeholder: "*", correct_answer: "8fa14cdd754f91cc6554c9e71929cce7")
    
    let question_2:Multiple_Choice_Question = Multiple_Choice_Question(question: "What to use to escape the period if you need to start an unordered list item with a number followed by a period", selections: ["^","@","%","\\","+","=","_"], correctAnswer: ["28d397e87306b8631f3ed80d858d35f0"])
    
    let question_3:Editing_Question = Editing_Question(md_string: """
1. First item
2. Second item
    - item 1
    - item 2
    - 2023\\. Current year
        Today is 5/18
        > Tomorrow will be 5/19
3. Third item
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Multiple_Choice_View(question: question_2).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 500)
                Editing_View(question: question_3).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 400)
                   
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.lists_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.lists_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.lists_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.lists_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to organize items with lists", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
