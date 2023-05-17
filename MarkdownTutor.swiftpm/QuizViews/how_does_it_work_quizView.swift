//
//  how_does_it_work.swift
//  
//
//  Created by 蕭博文 on 2023/5/16.
//

import Foundation
import SwiftUI


struct how_does_it_work_quizView:View {
    
    let question_1:Fill_In_The_Blank_Question = Fill_In_The_Blank_Question(question: "Markdown applications use something called ?", placeholder: "******** *********", correct_answer: "c3c8d86339348e9cc3625389127250f8")
    
    let question_2:Sorting_Question  = Sorting_Question(question: "Sort the four-part process", correctAnswer: ["05034269900dea65e0b5c24aa3aeda18","4091a46dbd02a847edde4d7b8936863c","b2b72cfa5cb3d7bb4a68a79a965b0b5e","f862b40155414898783c6af748f1bf5d"])
    
    @State var question_2_items :[String] = ["Open the file in a Markdown application","View it via web browser or Markdown application","Convert it to an HTML document","Create a Markdown file with .md or .markdown extension"].shuffled()
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body:some View{
        VStack{
            ScrollView{
                Fill_In_The_Blank_View(question: question_1)
                Sorting_View(question: question_2, items: $question_2_items).frame(minWidth: UIScreen.main.bounds.width/2,minHeight: 350)
            }
            Spacer()
            Button(action: {
                isShowingDialog.toggle()
            }, label: {
                Text(Defaults.shared.how_does_it_work_is_done ? "Done":"Mark As Done")
            })
            .disabled(Defaults.shared.how_does_it_work_is_done)
            .buttonStyle(Mark_As_Done(stauts: Defaults.shared.how_does_it_work_is_done))
            .confirmationDialog("Please make sure you have answered questions above", isPresented: $isShowingDialog, titleVisibility: .visible) {
                
                Button("I have answered them", role: .destructive) {
                    Defaults.shared.how_does_it_work_is_done.toggle()
                    isShowingCongrats.toggle()
                }
                Button("I haven't", role: .cancel) {
                }
            }
            Spacer(minLength: 80)
        }.popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this paragraph, now you understand hot markdwon works", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}
