//
//  WorkoutView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Morgana Galamba on 31/05/21.
//

import SwiftUI
import WatchKit

struct WorkoutView: View {
    
    @State var timerVal = 20
    
    var body: some View {
        VStack{
            Text("00:\(timerVal)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
                        if self.timerVal > 0 {
                            self.timerVal -= 1
                        }
                        
                    }
                }
            Image("Chart")
                .padding()
            
            HStack{
                Text("Prancha")
                Spacer()
            }
        }
        .padding()
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
