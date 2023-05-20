//
//  PlaygroundView.swift
//  
//
//  Created by 蕭博文 on 2023/5/19.
//

import Foundation
import SwiftUI
import MarkdownUI

struct PlaygroundsView:View {
    @AppStorage("playground_edit") var playground_edit:String = ""
    
    @State var view_index = 0
    @State private var showShareSheet:Bool = false
    private let default_msg:String = """
## This is a playground for makrdown
Feel free to write down anything

> Button on top right allows you copy written markdwon or export as text file
>
> **Some extended syntax might not work**
>> This message will only appear when playground is empty
"""
    
    var body: some View{
        TabView(selection: $view_index){
            VStack{
                TextEditor(text: $playground_edit)
                    .font(.body)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .border(.primary)
                    .padding(10)
            }
            .padding(.bottom, 30.0)
            .tag(0)
            
            ScrollView{
                Markdown(playground_edit.isEmpty ? default_msg : playground_edit)
                    .markdownTheme(.gitHub)
                    .padding()
            }
            .padding(.bottom, 30.0)
            .tag(1)
            
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .overlay(alignment: .topTrailing) {
                if (view_index==0){
                    ShareLink(item: playground_edit){
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .padding(5)
                    .background(Color.primary.opacity(0.15))
                    .cornerRadius(10)
                    .padding()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
    }
}
