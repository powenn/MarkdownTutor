//
//  what_is_markdown_good_for_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/16.
//

import Foundation
import SwiftUI

struct what_is_markdown_good_for_quizView:View {
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "Markdown is good for _  everything ?", placeholder: "**********", correct_answer: "f9f9c04813a46502873a0c2a3d361ce8")
    
    let question_2:Multiple_Choice_Question = Multiple_Choice_Question(question: "Markdown is good for ?", selections: ["websites","documents","notes","books","presentations","email","collaboration","scripts"], correctAnswer: ["1dd6473a75df4ac65f0911dbafee927f","21f64da1e5792c8295b964d159a14491","4358b5009c67d0e31d7fbf1663fcd3bf","7d8949bcbf85067fceda9f84a6affb6b","78b85e002131f08b636e58bb814adc68","0c83f57c786a0b4a39efab23731c7ebc","11a7a5d55a91adb201e113967eff93fe"])
        
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Multiple_Choice_View(question: question_2).frame(minWidth: UIScreen.main.bounds.width/2,minHeight: 500)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.what_is_markdown_good_for_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.what_is_markdown_good_for_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.what_is_markdown_good_for_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.what_is_markdown_good_for_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 80)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, we are close to basic syntax chapter", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
