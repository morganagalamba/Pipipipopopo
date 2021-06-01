//
//  PauseView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Palloma Ramos on 01/06/21.
//

import SwiftUI
import WatchKit

struct PauseView: View {
    
    var body: some View {
        VStack{
            Button("Pausar") {
                print("Pausou!")
            }
            .frame(width: 160.0, height: 36.0)
            .cornerRadius(10)
            .position(.init(x: 90, y: 60))
            
//           Button("Finalizar") {
//                print("Finalizou!")
//               }
            
            NavigationLink(destination: AmazingView()) {
                Text("Finalizar")
            }
            
            
//            Button(action: {
//                print("Floating Button Click")
//            }, label: {
//                NavigationLink(destination: AmazingView()) {
//                     Text("Finalizar")
//                 }
//            })
            .frame(width: 160.0, height: 36.0)
            .foregroundColor(.red)
            .cornerRadius(10)
            .position(.init(x: 90, y: 20))
        }
    }
    
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}

