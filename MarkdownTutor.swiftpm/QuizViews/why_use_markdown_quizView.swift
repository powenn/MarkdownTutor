//
//  why_use_markdown_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/15.
//

import Foundation
import SwiftUI


struct why_use_markdown_quizView:View {
    let question_1:Multiple_Choice_Question = Multiple_Choice_Question(question: "What does people use markdown to create ?", selections: ["websites","documents","notes","books","presentations","email messages","technical documentation","software","spaceship"], correctAnswer: ["1dd6473a75df4ac65f0911dbafee927f","21f64da1e5792c8295b964d159a14491","4358b5009c67d0e31d7fbf1663fcd3bf","7d8949bcbf85067fceda9f84a6affb6b","78b85e002131f08b636e58bb814adc68","066c78929737660741a1f59cc44a55ec","f04f45ed15cd708d1f9ede02c3c2361e"])
    
    
    let question_2:Multiple_Choice_Question = Multiple_Choice_Question(question: "Markdown is ?", selections: ["portable","platform independent","future proof","everywhere","everything","anything"], correctAnswer: ["1a8056c59b33ba44a02b0fc6dee44e83","410831c5c9de698a37e1d8092cda041e","3c305abfd435682b4c2e002c56d5d969","cbebc850f5f849e8956b5f8075f48f69"])
    
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Multiple_Choice_View(question: question_1).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 400)
                Divider()
                Multiple_Choice_View(question: question_2).frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 400)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.why_use_markdown_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.why_use_markdown_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.why_use_markdown_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.why_use_markdown_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 80)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, go ahead", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
