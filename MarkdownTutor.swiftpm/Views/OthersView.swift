//
//  OthersView.swift
//  
//
//  Created by 蕭博文 on 2023/5/20.
//

import Foundation
import SwiftUI
import MarkdownUI

struct OthersView:View{
    
    @AppStorage("developer_mode") var developer_mode = false
    @State var tapCount = 0
    
    var body: some View{
        NavigationStack{
            Form(){
                Section(content: {
                    Text("Version : \(appVersion!)")
                        .onTapGesture {
                            tapCount+=1
                        }
                    NavigationLink("About this app"){
                        README_View()
                    }
                    if (tapCount>=6 || developer_mode) {
                        Toggle("Developer Mode", isOn: $developer_mode)
                    }
                }, header: {
                    Text("General")
                }, footer: {
                    Text("Made by powenn on github")
                })
                
                if (developer_mode){
                    Section("Developer", content: {
                        ExportView()
                    })
                }
            }
        }
    }
}

struct README_View:View{
    var body: some View{
        ScrollView{
            Markdown(README)
                .markdownTheme(.gitHub)
                .padding()
        }
    }
}
