//
//  TutorialView.swift
//  
//
//  Created by 蕭博文 on 2023/5/21.
//

import Foundation
import SwiftUI


struct TutorialView:View {
    @Environment(\.dismiss) var dismiss
    @State var view_index = 0
    var body: some View{
        
        NavigationStack{
            TabView(selection: $view_index){
                Tutorial_1_View(view_index: $view_index).tag(0)
                Tutorial_2_View().tag(1)

                
                
            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
        .overlay(alignment:.topTrailing, content: {
            Button(action: {
                dismiss()
            }, label: {
                Label("", systemImage: "xmark.circle.fill")
                    .imageScale(.large)
                    .font(.title)
                    .foregroundColor(Color.cyan)
            })
        })
    }
}

struct Tutorial_1_View:View{
    @Binding var view_index:Int
    var body: some View{
        VStack{
            Text("MarkdownTutor")
                .font(.title)
                .fontWeight(.bold)
            Text("An app tutoring markdown")
                .font(.title2)
                .fontWeight(.semibold)
            Button(action: {
                view_index+=1
            }, label: {
                Label("Next", systemImage: "arrowshape.right.fill")
            })
        }.padding()
    }
}


struct Tutorial_2_View:View{
    var body: some View{
        VStack{

            
        }.padding()
    }
}
