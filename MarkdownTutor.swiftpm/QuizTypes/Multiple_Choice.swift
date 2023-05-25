//
//  Multiple_Choice.swift
//  
//
//  Created by 蕭博文 on 2023/5/15.
//

import Foundation
import SwiftUI

struct Multiple_Choice_Question {
    let question:String
    var selections:[String]
    let correctAnswer:[String]
    // Make sure all answer hash were generate from lowercase
    init(question: String, selections: [String], correctAnswer: [String]) {
        self.question = question
        self.selections = selections.shuffled()
        self.correctAnswer = correctAnswer
    }
}

struct Multiple_Choice_View:View{
    let question:Multiple_Choice_Question
    @State var status:Bool = false
    @State private var showFloater = false
    
    @State var multiSelection = Set<String>()
    
    private func checkAnswer() {
        if (multiSelection.map({$0.md5}).sorted().elementsEqual(question.correctAnswer.sorted())){
            status = !status
        }
        showFloater.toggle()
    }
    var body: some View{
        VStack(alignment: .leading){
            Text(question.question)
                .fontWeight(.medium)
            List(question.selections, id:\.self, selection: $multiSelection) { selection in
                Text(selection)
                    .font(.body)
            }.listStyle(.inset)
                .environment(\.editMode, .constant(EditMode.active))
                .disabled(status)
            Button(action: {
                checkAnswer()
            }, label: {
                Text(status ? "Correct" : "Submit")
            }).buttonStyle(Submit(stauts: status))
                .disabled(status)
                .popup(isPresented: $showFloater) {
                    if (status){
                        CorrectAnswerNotify()
                    } else {
                        WrongAnswerNotify()
                    }
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
