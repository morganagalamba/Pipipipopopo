//
//  AmazingView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Palloma Ramos on 01/06/21.
//

import SwiftUI
import WatchKit

struct AmazingView: View {
    
    var body: some View {
        VStack{
           Text("AMAZING!")
            Text("Você completou o treino")
                .font(.system(size: 14))
            Image("Amazing")
                .padding()
            Button("menu") {
                print("Button tapped!")
            }
            .frame(width: 160.0, height: 36.0)
            .foregroundColor(.black)
            .background(Color(" ButtonColor"))
            .cornerRadius(10)
            
            
            
        }
    }
    
}

struct AmazingView_Previews: PreviewProvider {
    static var previews: some View {
        AmazingView()
    }
}


