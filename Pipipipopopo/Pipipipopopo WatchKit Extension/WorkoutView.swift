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
    @State var minutes: Int = 1
    @State var seconds: Int = 10
    
    var body: some View {
        VStack{
            Text("\(minutes):\(seconds)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                        if self.minutes > 0 {
                            if self.seconds > 0 {
                                self.seconds -= 1
                            } else {
                                self.seconds = 59
                                self.minutes -= 1
                                
                            }
                        } else if self.minutes == 0 {
                            if self.seconds > 0 {
                                self.seconds -= 1
                            }
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
