//
//  paragraphs_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/16.
//

import Foundation
import SwiftUI

struct paragraphs_quizView:View {
    
    let question_1:Editing_Question = Editing_Question(md_string: """
## paragraph practice

paragraph1

paragraph2

paragraph3
""")
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Editing_View(question: question_1)
                    .frame(minWidth: UIScreen.main.bounds.width/3,minHeight: 400)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.paragraphs_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.paragraphs_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.paragraphs_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.paragraphs_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to create paragraphs in markdown", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
        
    }
}
