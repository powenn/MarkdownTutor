//
//  File.swift
//  
//
//  Created by 蕭博文 on 2023/5/14.
//

import Foundation
import SwiftUI

struct Mark_As_Done:ButtonStyle {
    var stauts:Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
//            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width/2)
            .foregroundColor(Color.white)
            .background(stauts ? Color.green : Color.blue)
            .cornerRadius(10)        
    }
}
