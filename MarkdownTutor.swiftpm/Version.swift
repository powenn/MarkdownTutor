//
//  Version.swift
//  MarkdownTutor
//
//  Created by 蕭博文 on 2023/5/20.
//

import Foundation

let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
