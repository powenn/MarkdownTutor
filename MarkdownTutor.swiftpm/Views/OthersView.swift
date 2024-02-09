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
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("developer_mode") var developer_mode = false
    @AppStorage("playBackgroundMusic") var playBackgroundMusic:Bool = true
    @State var tapCount = 0
    @State var showTutorial = false
    
    var body: some View{
        NavigationStack{
            Form(){
                Section("Version", content: {
                    Text("Version : \(appVersion!)")
                        .font(.body)
                }).onTapGesture {
                    tapCount+=1
                }
                
                Section("General", content: {
                    NavigationLink("About this app"){
                        README_View()
                    }
                    
                    
                   Button("How to use this app", action: {
                       showTutorial.toggle()
                   }).fullScreenCover(isPresented: $showTutorial, content: {
                       TutorialView()
                   })
                    
                    Link("Source code", destination: URL(string: "https://github.com/powenn/MarkdownTutor")!)
                    
                    Toggle("Background Music", isOn: $playBackgroundMusic).onChange(of: playBackgroundMusic) { value in
                        if value == false {
                            stopBackgroundMusic()
                        } else {
                            startBackgroundMusic()
                        }
                    }
                    
                    if (tapCount>=6 || developer_mode) {
                        Toggle("Developer Mode", isOn: $developer_mode)
                    }
                })
                
                Button("Back to home", action: {
                    dismiss()
                })
                
                if (developer_mode){
                    Section("Developer", content: {
                        ExportView()
                    })
                }
                
                Section(content: {}, footer: {
                    Text("Made by powenn on github")
                })
                
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
        .navigationTitle("About this app")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview(body: {
    OthersView()
})
