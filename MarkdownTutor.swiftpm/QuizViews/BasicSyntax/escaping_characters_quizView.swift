//
//  escaping_characters_quizView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct escaping_characters_quizView:View {
    
    let question_1:Editing_Question = Editing_Question(md_string: """
\\*\\*bold\\*\\*<br>
\\*italic\\*<br>
\\# Heading level 1<br>
\\- item
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
                Text(Defaults.shared.escaping_characters_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.escaping_characters_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.escaping_characters_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.escaping_characters_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 50)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you should know how to display a literal character that would otherwise be used to format text", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
