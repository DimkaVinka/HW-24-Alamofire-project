//
//  StringExtension.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 16.04.2022.
//

import Foundation
import CryptoKit

extension String {
var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
