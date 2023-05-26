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
                Tutorial_2_View(view_index: $view_index).tag(1)
                Tutorial_3_View(view_index: $view_index).tag(2)
                Tutorial_4_View(view_index: $view_index).tag(3)
                Tutorial_5_View(view_index: $view_index).tag(4)
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
            Spacer()
            Image("mode_picker")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
            Text("Click here to select mode\n\nFor beginner who haven't heard markdown,I recommend to start from here.")
                .font(.body)
                .multilineTextAlignment(.leading)
            Spacer()
            Button(action: {
                view_index+=1
            }, label: {
                Label("Next", systemImage: "arrowshape.right.fill")
                    .font(.headline)
            }).padding(.bottom, 40.0)
        }.padding()
    }
}


struct Tutorial_2_View:View{
    @Binding var view_index:Int
    var body: some View{
        VStack{
            Spacer()
            Image("Beginner1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 100)
            Image("Beginner2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 100)
            Text("In beginner mode\nYou will see circle style checkmark.\n\nOnce you have read and understand the lesson or complete the quiz,\nclick the button on top right to mark as complete.")
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Spacer()
            Button(action: {
                view_index+=1
            }, label: {
                Label("Next", systemImage: "arrowshape.right.fill")
                    .font(.headline)
            }).padding(.bottom, 40.0)
        }.padding()
    }
}

struct Tutorial_3_View:View{
    @Binding var view_index:Int
    var body: some View{
        VStack{
            Spacer()
            Image("Standard1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 100)
            Image("Standard2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
            Text("In standard mode,you will see seal style checkmark.\n\nOnly paragraphs having quiz have it.\nSlide to switch to quiz view and you will see checkmark on top right,\nclick it to mark as complete after answered all the questions correctly.")
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Spacer()
            Button(action: {
                view_index+=1
            }, label: {
                Label("Next", systemImage: "arrowshape.right.fill")
                    .font(.headline)
            }).padding(.bottom, 40.0)
        }.padding()
    }
}

struct Tutorial_4_View:View{
    @Binding var view_index:Int
    var body: some View{
        VStack{
            Spacer()
            Image("Beginner3")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 200)
            Text("For list, long press on it and you can drag to rerange.")
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Spacer()
            Button(action: {
                view_index+=1
            }, label: {
                Label("Next", systemImage: "arrowshape.right.fill")
                    .font(.headline)
            }).padding(.bottom, 40.0)
        }.padding()
    }
}

struct Tutorial_5_View:View{
    @Environment(\.dismiss) var dismiss
    @Binding var view_index:Int
    var body: some View{
        VStack{
            Spacer()
            Image("EditQuiz")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 200)
            Text("For editing quiz,slide to switch between question and editing area.\n\nButton on top right allows you to view the template solution and viewing the rendered output.")
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Label("Close", systemImage: "xmark.circle.fill")
                    .font(.headline)
            }).padding(.bottom, 40.0)
        }.padding()
    }
}
