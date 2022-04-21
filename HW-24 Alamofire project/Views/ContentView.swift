//
//  ContentView.swift
//  HW-24 Alamofire project
//
//  Created by Дмитрий Виноградов on 14.04.2022.
//

import SwiftUI
import SystemConfiguration

struct ContentView: View {
    
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com")
    @EnvironmentObject var controller: Controller
    @State private var show = false
    @State private var showAlert = false
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Color.init(hex: "#EC1D24").edgesIgnoringSafeArea(.all)
            Button {
                var flags = SCNetworkReachabilityFlags()
                SCNetworkReachabilityGetFlags(self.reachability!, &flags)
                
                if self.isNetworkReachability(with: flags) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        self.show.toggle()
                        controller.getData()
                    }
                } else {
                    self.showAlert.toggle()
                    controller.getData()
                }
            } label: {
                VStack {
                    Image("marvelLogo")
                        .resizable()
                        .frame(width: 170, height: 50, alignment: .center)
                    Text("Press to get Character")
                        .foregroundColor(Color.init(hex: "#EC1D24"))
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .navigationBarHidden(true)
            }.alert(isPresented: self.$showAlert) {
                Alert(title: Text("No Internet Connection!"), message: Text("Check you Wi-Fi or Cellular connection and try again!"), dismissButton: .default(Text("Ok")))
            }
            
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
            
            if show {
                TableView(spiderManData: controller.spiderManData)
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                    .tint(Color.init(hex: "#EC1D24"))
            }
        }
    }
    
    private func isNetworkReachability(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomaticly = flags.contains(.connectionOnDemand) || flags.contains(.interventionRequired)
        let canConnectWithoutInteraction = canConnectAutomaticly && !flags.contains(.interventionRequired)
        
        return isReachable && (!needsConnection || canConnectWithoutInteraction)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
