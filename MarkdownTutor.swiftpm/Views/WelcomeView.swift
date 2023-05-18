//
//  WelcomeView.swift
//  MarkdownTutor
//
//  Created by 蕭博文 on 2023/5/10.
//

import SwiftUI
import MarkdownUI

struct WelcomeView: View {
    @Binding var startClick:Bool
    var body: some View {
        VStack{
            Spacer()
            Image("MD_Logo")
                .resizable()
                .scaledToFill()
                .frame(
                    width:0,
                    height:UIScreen.main.bounds.height/6
                )
            Markdown("# ***MarkdownTutor***")
            Spacer()
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
            }.padding()
        }.padding()
    }
}
