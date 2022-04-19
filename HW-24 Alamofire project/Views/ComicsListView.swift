//
//  ComicsListView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 17.04.2022.
//

import SwiftUI

struct ComicsListView: View {
    
    @State var comicsName: [ItemsStruct]
    
    var body: some View {
        List {
                ForEach(comicsName, id: \.name) { item in
                    Text(item.name)
                }
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(comicsName: [ItemsStruct(resourceURI: "", name: "")])
    }
}
