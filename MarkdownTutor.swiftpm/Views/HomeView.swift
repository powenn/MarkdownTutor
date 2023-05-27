//
//  HomeView.swift
//  MarkdownTutor
//
//  Created by 蕭博文 on 2023/5/10.
//

import SwiftUI
import MarkdownUI

struct HomeView: View {
    @Binding var startClick:Bool
    @State var showTutorial = false
    
    @Binding var selectedMode:TutorMode
    // Try binding with content view
    
    let tutorModes:[TutorMode] = [.beginner,.standard]
    
    var body: some View {
        VStack{
            Spacer()
            Image("icon")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(
                    width:0,
                    height:UIScreen.main.bounds.height/6
                )
            Markdown("# ***MarkdownTutor***")
            Spacer()
            VStack{
                Picker("Select mode", selection: $selectedMode) {
                    ForEach(tutorModes, id: \.self) { mode in
                        Text(mode.rawValue)
                            .font(.body)
                    }
                }
                .pickerStyle(.menu)
                Button("How to use this app", action: {
                    showTutorial.toggle()
                }).fullScreenCover(isPresented: $showTutorial, content: {
                    TutorialView()
                }).font(.body)
            }.padding()
            VStack {
                Button(action: {
                    startClick =  true
                }, label: {
                    Text("Start")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 3.0)
                                .foregroundColor(Color.secondary)
                                .frame(minWidth: UIScreen.main.bounds.height/6)
                        )
                })
            }// .padding()
        }.padding()
    }
}
