//
//  Lesson_4_View.swift
//  
//
//  Created by 蕭博文 on 2023/5/25.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Lesson_4_View:View{
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body: some View{
        VStack{
            ScrollView{
//                Markdown(tut).markdownTheme(.gitHub)
//                    .padding()
//                Lesson_3_ListsView().frame(minWidth: UIScreen.main.bounds.width/2,minHeight: 350)
//                Markdown(tut2).markdownTheme(.gitHub)
//                    .padding()
            }
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingDialog.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(BeginnerDefaults.shared.lesson_3_is_done ? Color.green:Color.gray)
                })
                .disabled(BeginnerDefaults.shared.lesson_3_is_done)
                .confirmationDialog("Please make sure you have read and understand this lesson", isPresented: $isShowingDialog, titleVisibility: .visible) {
                    
                    Button("I have", role: .destructive) {
                        BeginnerDefaults.shared.lesson_3_is_done.toggle()
                        isShowingCongrats.toggle()
                    }
                    Button("I haven't", role: .cancel) {
                    }
                }
            }
        })
        .popup(isPresented: $isShowingCongrats, view: {CongratulationNotify(content: "Congrats you compeleted this lesson", onClose: {isShowingCongrats.toggle()})}, customize: {$0.closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))})
    }
}


