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
        NavigationView {
            VStack {
            
            Button("Pausar") {
                print("Pausou!")
            }
            .frame(width: 160.0, height: 36.0)
            .cornerRadius(10)
            .position(.init(x: 80, y: 40))
            
//           Button("Finalizar") {
//                print("Finalizou!")
//               }
            
            NavigationLink(destination: AmazingView()) {
                Text("Finalizar")
            }

            .frame(width: 160.0, height: 36.0)
            .foregroundColor(.red)
            .cornerRadius(10)
            .position(.init(x: 80, y: 20))
        }
        }
    }
    
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}

