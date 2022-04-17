//
//  ContentView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var controller = Controller()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                NavigationLink {
                    TableView()
                } label: {
                    VStack {
                        Image("marvelLogo")
                            .resizable()
                            .frame(width: 170, height: 50, alignment: .center)
                        Text("Press to get Character")
                            .foregroundColor(Color.init(hex: "#EC1D24"))
                    }
                }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .navigationBarHidden(true)
                Group {
                    if controller.isLoaded {
                        VStack(alignment: .center) {
                            Spacer()
                            Text(controller.copyright)
                                .font(.system(size: 14))
                            Text(controller.attributionText)
                                .font(.system(size: 14))
                        }.padding()
                    } else {
                        Text(controller.copyright)
                    }
                }
                .onAppear {
                    self.controller.getData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
