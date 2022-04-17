//
//  Controller.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 16.04.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getCardsFromURL(complition: @escaping (CardModel) -> ())
}

class Controller: ObservableObject {
    
    private var networkManager: NetworkManagerProtocol?
    
    @Published var copyright = "copyright"
    @Published var attributionText = "attribute text"
    @Published var spiderManName = ""
    @Published var comicsItemName = ""
    @Published var imageURL = ""

    func makeImageURL(path: String, extensionToPath: String) -> String {
        return path + "/landscape_xlarge." + extensionToPath
    }
    
    func getData() {
        networkManager?.getCardsFromURL(complition: { card in
            self.copyright = card.copyright
            self.attributionText = card.attributionText
            for item in card.data.results {
                self.spiderManName = item.name
                self.imageURL = self.makeImageURL(path: item.thumbnail.path, extensionToPath: item.thumbnail.extension)
            }
        })
    }
}
