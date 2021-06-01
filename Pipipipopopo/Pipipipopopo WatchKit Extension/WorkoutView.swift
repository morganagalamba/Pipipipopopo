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
    @State var minutes: Int = 0
    @State var seconds: Int = 10
    @State var zeroMinutes: String = ""
    @State var zeroSeconds: String = ""
    
    var body: some View {
        VStack{
            Text("\(zeroMinutes)\(minutes):\(zeroSeconds)\(seconds)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onAppear(){
                    if self.minutes < 10 {
                        self.zeroMinutes = "0"
                    } else {
                        self.zeroMinutes = ""
                    }
                    if self.seconds < 10 {
                        self.zeroSeconds = "0"
                    }
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                        if self.minutes > 0 {
                            if self.seconds > 0 {
                                self.seconds -= 1
                            } else {
                                self.seconds = 59
                                self.minutes -= 1
                                self.zeroSeconds = ""
                            }
                        } else if self.minutes == 0 {
                            if self.seconds > 0 {
                                self.seconds -= 1
                            }
                        }
                        if self.minutes < 10 {
                            self.zeroMinutes = "0"
                        } else {
                            self.zeroMinutes = ""
                        }
                        if self.seconds < 10 {
                            self.zeroSeconds = "0"
                        }
                        
                        if self.seconds == 0 && self.minutes == 0 {
                            WKInterfaceDevice.current().play(.stop)
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
