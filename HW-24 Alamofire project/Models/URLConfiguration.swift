//
//  URLConfiguration.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 16.04.2022.
//

import Foundation

class URLConfiguration {
    public func getURL(publicKey: String, privateKey: String) -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = format.string(from: date)

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gateway.marvel.com"
        urlComponents.path = "/v1/public/characters"
        urlComponents.queryItems = [URLQueryItem(name: "nameStartsWith", value: "Spider-Man"),
                                    URLQueryItem(name: "ts", value: timestamp),
                                    URLQueryItem(name: "apikey", value: publicKey),
                                    URLQueryItem(name: "hash", value: (timestamp + privateKey + publicKey).MD5)]
        return urlComponents.url!.absoluteString
    }
}
