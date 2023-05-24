//
//  Intro_View.swift
//  
//
//  Created by 蕭博文 on 2023/5/24.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Intro_View:View{
    let tut:String = """
# Intro to Markdown
> In this lesson, you will learn the basic of Markdown, how it worsk, and what you can do with it.
>> In beginner mode, It will be a simple introduction, For interest, you can learn more details in standard mode.
>>
>> I will introduce the mostly used syntax in markdwon in lessons.

- History
- What is Markdown?
- Benefits of Markdown
---
## History

Markdown was inspired by pre-existing conventions for marking up plain text in email and usenet posts, such as the earlier markup languages setext.

In 2002 Aaron Swartz created atx and referred to it as “the true structured text format”. Swartz and Gruber then worked together to create the Markdown language in 2004, with the goal of enabling people "to write using an easy-to-read and easy-to-write plain text format, optionally convert it to structurally valid XHTML (or HTML).

---

## What is Markdown?

Markdown is a lightweight markup language that describes how text should look on a page. HTML is another example of a markup language. Markdown is a style of writing documents that makes it easy to define what the content should look like. It describes headers, text styles, links, lists and so much more.

## Benefits of Markdown

- Markdown is easy to read and write.
- Writers and publishers love writing with Markdown as it reduces distractions.
- It's intentionally simple.
- Lets you focus on important things and increases productivity.
- Converts plain text into HTML.
- Multi-platform.
- It doesn't break.
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body: some View{
        VStack{
            ScrollView{
                    Markdown(tut).markdownTheme(.gitHub)
                .padding()
            }
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingDialog.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(BeginnerDefaults.shared.intro_is_done ? Color.green:Color.gray)
                })
                .disabled(BeginnerDefaults.shared.intro_is_done)
                .confirmationDialog("Please make sure you have read and understand this lesson", isPresented: $isShowingDialog, titleVisibility: .visible) {
                    
                    Button("I have", role: .destructive) {
                        BeginnerDefaults.shared.intro_is_done.toggle()
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
