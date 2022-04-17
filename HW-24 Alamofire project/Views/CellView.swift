//
//  CellView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct CellView: View {
    
    @State var image = "landscape_xlarge"
    @State var name = "Some character"
    
    var body: some View {
        ZStack {
            Color.init(hex: "#EC1D24")
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 90, alignment: .center)
                .foregroundColor(Color.white)
                .shadow(radius: 7)
            HStack(alignment: .center) {
                Image(image)
                    .resizable()
                    .frame(width: 120, height: 80, alignment: .leading)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                Text(name)
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
