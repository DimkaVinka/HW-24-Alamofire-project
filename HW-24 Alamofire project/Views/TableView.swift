//
//  TableView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct TableView: View {
    
    var controller: Controller
    @State var show = false
    @State var columns = [GridItem()]
    @State var comicsNames = [ItemsStruct]()

    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "#EC1D24")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Spider-Man Versions")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .heavy, design: .rounded))
                    LazyVGrid(columns: columns) {
                        ForEach(controller.spiderManData, id: \.name) { card in
                            CellView(image: makeImageURL(path: card.thumbnail.path, extensionToPath: card.thumbnail.extension), name: card.name)
                        }
                    }
                }
            }
            .navigationTitle("Versions")
            .navigationBarHidden(true)
            
        }
        
        if show {
            ContentView()
                .transition(.asymmetric(insertion: .opacity, removal: .scale))
        }
    }
    
    func makeComics() {
        for item in controller.spiderManData {
            self.comicsNames = item.comics.items
        }
        
    }
    
    func makeImageURL(path: String, extensionToPath: String) -> String {
        return path + "/landscape_xlarge." + extensionToPath
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(controller: Controller())
    }
}
