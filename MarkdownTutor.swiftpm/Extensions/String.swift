//
//  String.swift
//  
//
//  Created by 蕭博文 on 2023/5/15.
//

import Foundation
import CryptoKit

extension String {
    var md5: String {
        let digest = Insecure.MD5.hash(data: data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
