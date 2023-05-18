//
//  Editing.swift
//  
//
//  Created by 蕭博文 on 2023/5/16.
//


import Foundation
import SwiftUI
import MarkdownUI

struct Editing_Question {
    let id = UUID()
    let md_string:String
}


struct Editing_View:View{
    let question:Editing_Question
    @State var editArea:String = ""
    
    @State var view_index = 0
    @State var is_show_rendered:Bool = false
    @State var is_show_template:Bool = false
    
    var body: some View {
        TabView(selection: $view_index){
            VStack{
                if (is_show_template) {
                    Text(question.md_string)
                        .font(.body)
                        .padding()
                        .border(Color.secondary)
                } else {
                    Text("Try write some markdown to produce the result below")
                        .fontWeight(.medium)
                    Markdown(question.md_string)
                        .markdownTheme(.gitHub)
                        .padding()
                        .border(Color.secondary)
                        .padding()
                }
            }.tag(0)
            VStack{
                if (!is_show_rendered) {
                    TextEditor(text: $editArea)
                        .font(.body)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .border(Color.secondary)
                        .padding(10)
                } else {
                    Text("Rendered output")
                        .fontWeight(.medium)
                    Markdown(editArea)
                        .markdownTheme(.gitHub)
                        .padding()
                        .border(Color.secondary)
                        .padding()
                }
            }.tag(1)
            
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .overlay(alignment: .topTrailing) {
                Button(action:{
                    switch $view_index.wrappedValue {
                    case 0 :
                        is_show_template.toggle()
                    case 1:
                        is_show_rendered.toggle()
                    default:
                        break
                    }
                }){
                    switch $view_index.wrappedValue {
                    case 0 :
                        Label(is_show_template ? "Question" :"Template", systemImage: "eyes")
                            .font(.body)
                    case 1:
                        Label("Switch", systemImage: "square.2.layers.3d")
                            .font(.body)
                    default:
                        EmptyView()
                    }
                }
                .padding(5)
                .background(Color.primary.opacity(0.15))
                .cornerRadius(10)
                .padding()
            }
            .onTapGesture {
                hideKeyboard()
            }
            .border(Color.primary)
            .padding(5)
    }
}
