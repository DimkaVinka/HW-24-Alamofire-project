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
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "#EC1D24")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(controller.spiderManData, id: \.name) { card in
                            Button {
                                showModal = true
                            } label: {
                                CellView(image: makeImageURL(path: card.thumbnail.path, extensionToPath: card.thumbnail.extension), name: card.name)
                            }.sheet(isPresented: $showModal) {
                                ComicsListView(comicsName: card.comics.items)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Spider-Man Versions"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        Button {
                            show = true
                        } label: {
                            Image(systemName: "house")
                        }.foregroundColor(Color.black)
                    }
                }
            }
            
        }
        if show {
            ContentView()
                .transition(.asymmetric(insertion: .opacity, removal: .opacity))
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
