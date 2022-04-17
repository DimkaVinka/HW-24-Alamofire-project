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
    @Published var spiderManData = [ResultStruct]()
    @Published var comicsItemName = ""
    
    func getData() {
        delegate?.getCardsFromURL(complition: { card in
            self.copyright = card.copyright
            self.attributionText = card.attributionText
            self.spiderManData = card.data.results
        })
        isLoaded = true
    }
    
    init() {
        delegate = NetworkManager()
    }
}
