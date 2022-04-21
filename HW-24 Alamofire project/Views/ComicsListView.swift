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
                ForEach(comicsName, id: \.resourceURI) { item in
                    ZStack {
                        Rectangle()
                            .frame(width: .infinity, height: 50, alignment: .center)
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                        Text(item.name)
                            .font(.body)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                    }
                    
                }.listRowBackground(Color.init(hex: "#EC1D24"))
            }.shadow(radius: 10)
                .padding(.top)
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(comicsName: [ItemsStruct(resourceURI: "", name: "Spider-Man the best marvel comics person! The best! otvechayu!")])
    }
}
