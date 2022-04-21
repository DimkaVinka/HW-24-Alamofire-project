//
//  SpiderManList.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 20.04.2022.
//

import SwiftUI

struct SpiderManList: View {
    
    var spider: ResultStruct
    @State private var showModal = false
    @State private var showingAlert = false
    
    var body: some View {
        
        if spider.comics.items.isEmpty {
            Button {
                showingAlert = true
            } label: {
                CellView(image: makeImageURL(path: spider.thumbnail.path, extensionToPath: spider.thumbnail.extension), name: spider.name)
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text(spider.name),
                      message: Text("No comics have been released for this Spider-Man yet"),
                      dismissButton: .default(Text("Got it!")))
            }
        } else {
            Button {
                showModal = true
            } label: {
                CellView(image: makeImageURL(path: spider.thumbnail.path, extensionToPath: spider.thumbnail.extension), name: spider.name)
            }.sheet(isPresented: $showModal) {
                ComicsListView(comicsName: spider.comics.items)
            }
        }
    }
    
    func makeImageURL(path: String, extensionToPath: String) -> String {
        return path + "/landscape_xlarge." + extensionToPath
    }
}

struct SpiderManList_Previews: PreviewProvider {
    static var previews: some View {
        SpiderManList(spider: ResultStruct(name: "", thumbnail: ThumbnailStruct(path: "", extension: ""), comics: ComicsStruct(items: [ItemsStruct(resourceURI: "", name: "")])))
    }
}
