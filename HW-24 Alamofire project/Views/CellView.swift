//
//  CellView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct CellView: View {
    
    @State var image = "landscape_xlarge"
    @State var name = "Some character"
    
    var body: some View {
            ZStack {
                Color.init(hex: "#EC1D24")
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .frame(width: .infinity, height: 90, alignment: .center)
                    .foregroundColor(Color.white)
                    .shadow(radius: 7)
                    .padding(.horizontal)
                    
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: image)) { image in
                        image.resizable()
                            .frame(width: 120, height: 80, alignment: .center)
                    } placeholder: {
                        ProgressView()
                    }
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    Text(name)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.horizontal)
            }.tint(Color.red)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
