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
                print("Button tapped!")
            }
            .frame(width: 160.0, height: 36.0)
            .cornerRadius(10)
            
            Button("Finalizar") {
                print("Button tapped!")
            }
            .frame(width: 160.0, height: 36.0)
            .foregroundColor(.red)
            .cornerRadius(10)
        }
    }
    
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}

