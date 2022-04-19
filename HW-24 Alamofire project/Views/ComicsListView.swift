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
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        return ZStack {
            Color.init(hex: "#EC1D24").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(comicsName, id: \.name) { item in
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(Color.white)
                        Text(item.name)
                            .font(.body)
                    }
                    
                }.listRowBackground(Color.init(hex: "#EC1D24"))
            }.shadow(radius: 10)
                .padding(.top)
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(comicsName: [ItemsStruct(resourceURI: "", name: "")])
    }
}
