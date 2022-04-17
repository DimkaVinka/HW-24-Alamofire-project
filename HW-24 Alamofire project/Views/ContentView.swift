//
//  ContentView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var controller = Controller()
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    controller.getData()
                } label: {
                    Text("Press Me")
                }

                Text(controller.copyright)
                Text(controller.attributionText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
