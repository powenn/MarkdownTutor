//
//  File.swift
//  
//
//  Created by 蕭博文 on 2023/5/14.
//

import Foundation
import SwiftUI

struct Submit:ButtonStyle {
    var stauts:Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .fontWeight(.semibold)
            .padding(10)
            .foregroundColor(Color.white)
            .background(stauts ? Color.green : Color.blue)
            .cornerRadius(10)
    }
}
