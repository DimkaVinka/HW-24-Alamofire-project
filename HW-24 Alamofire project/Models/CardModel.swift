//
//  CardModel.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import Foundation

struct CardModel: Decodable {
    var copyright: String
    var attributionText: String
    var data: DataStruct
}

struct DataStruct: Decodable {
    var results: [ResultStruct]
}

struct ResultStruct: Decodable {
    var name: String
    var thumbnail: ThumbnailStruct
    var comics: ComicsStruct
}

struct ThumbnailStruct: Decodable {
    var path: String
    var `extension`: String
}

struct ComicsStruct: Decodable {
    var items: [ItemsStruct]
}

struct ItemsStruct: Decodable {
    var resourceURI: String
    var name: String
}
