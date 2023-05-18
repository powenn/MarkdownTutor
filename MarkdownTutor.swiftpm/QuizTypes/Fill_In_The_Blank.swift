//
//  Fill_In_The_Blank.swift
//  
//
//  Created by 蕭博文 on 2023/5/15.
//

import Foundation
import SwiftUI


struct Fill_In_The_Blank_Question {
    let id = UUID()
    let question:String
    let placeholder:String
    let correct_answer:String
}

struct Fill_In_The_Blank_View:View{
    let question:Fill_In_The_Blank_Question
    @State var status:Bool = false
    @State private var answer:String = ""
    @State private var showFloater = false
    
    private func checkAnswer() {
        if (answer.lowercased().md5==question.correct_answer){
            status = !status
        } else {
            showFloater.toggle()
        }
    }
    
    var body: some View{
        VStack(alignment: .leading){
            Text(question.question)
                .fontWeight(.medium)
            HStack {
                TextField(question.placeholder, text: $answer)
                    .font(.body)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
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
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .padding()
    }
}
