//
//  Lesson_3_View.swift
//
//
//  Created by 蕭博文 on 2023/5/24.
//

import Foundation
import SwiftUI
import MarkdownUI

struct Lesson_3_View:View{
    
    let tut:String = """
# Lesson 3
> In this lesson, you will learn how to create lists and denote a word or phrase as code.

- Lists
- Code
- Fenced Code Blocks
---

## Lists

To create an ordered list, add line items with numbers followed by periods.

For Example:
```
1. First item
2. Second item
3. Third item
4. Fourth item
```
### Rendered Output
1. First item
2. Second item
3. Third item
4. Fourth item

> You can try rerange the list below and observe its rendered output
>> For details, you will learn in standard mode
"""
    
    let tut2:String = """
---

## Code

To denote a word or phrase as code, enclose it in backticks (`).

Toggle the button to see the different rendered output of enclosed in backticks or not.
"""
    
    
    let tut3:String = """
---

## Fenced Code Blocks

To create code blocks , use three backticks (```) on the lines before and after the code block.

Toggle the button to see the different rendered output of enclosed in  three backticks or not.
"""
    
    @State var isShowingDialog = false
    @State var isShowingCongrats = false
    
    var body: some View{
        VStack{
            ScrollView{
                Markdown(tut).markdownTheme(.gitHub)
                    .padding()
                Lesson_3_ListsView().frame(minWidth: UIScreen.main.bounds.width/2,minHeight: 350)
                Markdown(tut2).markdownTheme(.gitHub)
                    .padding()
                Lesson_3_CodeView()
                Markdown(tut3).markdownTheme(.gitHub)
                    .padding()
                Lesson_3_FencedCodeBlockView()
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

struct Lesson_3_ListsView:View{
    @State var items:[String] = ["1. item 1","2. item 2","3. item 3","4. item 4"]
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Order of the list items")
                .font(.headline)
            List{
                ForEach(items,id: \.self){item in
                    Text(item)
                        .font(.body)
                }.onMove { from, to in
                    items.move(fromOffsets: from, toOffset: to)
                }
            }.listStyle(.inset)
            //            Text(items.joined(separator: "\n"))
            Text("Rendered Output")
                .font(.headline)
            Markdown("""
\(items.joined(separator: "\n"))
""")
        }.padding()
    }
}

struct Lesson_3_CodeView:View{
    @State var hasbackticks:Bool = true
    var body: some View{
        VStack(alignment: .leading) {
            Toggle("Enclosed:\(hasbackticks.description)", isOn: $hasbackticks)
                .font(.headline)
            Text(hasbackticks ? "\\`print(\"This is an example\")\\`" : "print(\"This is an example\")")
                .font(.body)
                .padding()
                .border(.primary)
            Text("Rendered Output")
                .font(.headline)
            Markdown("""
\(hasbackticks ? "`print(\"This is an example\")`" : "print(\"This is an example\")")
""")
            .markdownTheme(.gitHub)
            .padding()
            .border(.primary)
        }.padding()
    }
}

struct Lesson_3_FencedCodeBlockView:View{
    @State var hasbackticks:Bool = true
    var body: some View{
        VStack(alignment: .leading) {
            Toggle("Enclosed:\(hasbackticks.description)", isOn: $hasbackticks)
                .font(.headline)
            Text(hasbackticks ?
            """
            \\`\\`\\`
            while alive {
                Breath()
            }
            \\`\\`\\`
            """ :
            """
            while alive {
                Breath()
            }
            """
            )
            .font(.body)
            .padding()
            .border(.primary)
            Text("Rendered Output")
                .font(.headline)
            Markdown(hasbackticks ?
            """
            ```
            while alive {
                Breath()
            }
            ```
            """ :
            """
            while alive {
                Breath()
            }
            """)
            .markdownTheme(.gitHub)
            .padding()
            .border(.primary)
        }.padding()
    }
}
