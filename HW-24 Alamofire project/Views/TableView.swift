//
//  TableView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct TableView: View {
    
//    var controller: Controller
    @State var show = false
    @State var columns = [GridItem()]
    @State private var showModal = false
    @State private var searchText = ""
    @State var spiderManData = Controller().spiderManData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "#EC1D24")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(spiderManData, id: \.name) { card in
                            SpiderManList(spider: card)
                        }
                    }
                }
            }
            .navigationTitle(Text("Spider-Man Versions"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            self.show.toggle()
                        }
                    } label: {
                        Image(systemName: "house")
                    }.foregroundColor(Color.black)
                }
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { text in
            if !searchText.isEmpty {
                spiderManData = Controller().spiderManData.filter { $0.name.contains(text)}
            } else {
                spiderManData = Controller().spiderManData
            }
        }
        if show {
            ContentView()
                .transition(.asymmetric(insertion: .opacity, removal: .opacity))
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
