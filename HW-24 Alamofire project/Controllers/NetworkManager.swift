//
//  NetworkManager.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol {

    private let urlConfiguration = URLConfiguration()
    private var publicKey = "e6a6780f42402d4bb619881f4643acb4"
    private var privateKey = "7f83886f816d52df87d9282b5f5ac047075e95e0"
    
    func getCardsFromURL(complition: @escaping (CardModel) -> ()) {
        AF.request(urlConfiguration.getURL(publicKey: publicKey, privateKey: privateKey),
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil).response { responseData in
            guard let data = responseData.data else { return }
            do {
                let cards = try JSONDecoder().decode(CardModel.self, from: data)
                complition(cards)
            } catch let jsonError {
                print("error in JSON:", jsonError)
            }
        }
    }
}




