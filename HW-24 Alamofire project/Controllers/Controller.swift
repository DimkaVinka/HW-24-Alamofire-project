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
    
    private var delegate: NetworkManagerProtocol?
    
    @Published var isLoaded = false
    
    @Published var copyright = ""
    @Published var attributionText = ""
    @Published var spiderManName = ""
    @Published var comicsItemName = ""
    @Published var imageURL = ""

    func makeImageURL(path: String, extensionToPath: String) -> String {
        return path + "/landscape_xlarge." + extensionToPath
    }
    
    func getData() {
        delegate?.getCardsFromURL(complition: { card in
            self.copyright = card.copyright
            self.attributionText = card.attributionText
            for item in card.data.results {
                self.spiderManName = item.name
                self.imageURL = self.makeImageURL(path: item.thumbnail.path, extensionToPath: item.thumbnail.extension)
            }
        })
        isLoaded = true
    }
    
    init() {
        delegate = NetworkManager()
    }
}
