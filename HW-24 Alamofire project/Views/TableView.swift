//
//  TableView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct TableView: View {
    
    @ObservedObject var controller = Controller()
    @State var show = false
    @State private var columns = [
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            Color.init(hex: "#EC1D24")
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(controller.spiderManData, id: \.id) { card in
                    CellView(image: "", name: "")
                }
            }
        }
        
        if show {
            ContentView()
                .transition(.asymmetric(insertion: .opacity, removal: .scale))
        }
        
    }
    
    func makeImageURL(path: String, extensionToPath: String) -> String {
        return path + "/landscape_xlarge." + extensionToPath
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
