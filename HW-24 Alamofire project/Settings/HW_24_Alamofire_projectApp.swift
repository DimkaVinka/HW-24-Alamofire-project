//
//  HW_24_Alamofire_projectApp.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

@main
struct HW_24_Alamofire_projectApp: App {
    
    @State private var controller = Controller()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(controller)
        }
    }
}
