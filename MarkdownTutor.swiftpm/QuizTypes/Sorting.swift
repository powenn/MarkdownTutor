//
//  Sorting.swift
//  
//
//  Created by 蕭博文 on 2023/5/16.
//

import Foundation
import SwiftUI

struct Sorting_Question{
    let question:String
    let correctAnswer:[String]
    init(question: String, correctAnswer: [String]) {
        self.question = question
        //        self.items = items.shuffled()
        self.correctAnswer = correctAnswer
    }
}

// Pass items in quiz view


struct Sorting_View:View{
    let question:Sorting_Question
    @State var status:Bool = false
    @State private var showFloater = false
    @Binding var items:[String]
    
    private func checkAnswer() {
        if ($items.wrappedValue.map({$0.md5})).elementsEqual(question.correctAnswer){
            status = !status
        } else {
            showFloater.toggle()
        }
    }
    var body: some View{
        VStack(alignment: .leading){
            Text(question.question)
                .fontWeight(.medium)
            List{
                ForEach(items,id: \.self){item in
                    Text(item)
                        .font(.body)
                }.onMove { from, to in
                    items.move(fromOffsets: from, toOffset: to)
                }
            }.listStyle(.inset)
            Button(action: {
                checkAnswer()
            }, label: {
                Text(status ? "Correct" : "Submit")
            }).buttonStyle(Submit(stauts: status))
                .disabled(status)
                .popup(isPresented: $showFloater) {
                    WrongAnswerNotify()
                } customize: {
                    $0
                        .type(.floater())
                        .position(.bottom)
                        .animation(.spring())
                        .closeOnTapOutside(true)
                        .autohideIn(2)
                }
        }.padding()
    }
}
