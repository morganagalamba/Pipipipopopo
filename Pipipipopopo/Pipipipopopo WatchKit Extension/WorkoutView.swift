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
    @State var series: Int = 2
    @State var isTiming: Bool = true
    @State var exerciseCount: Int = 5
    @State var exerciseName: String = "Polichinelo"
    @State var exercises: Int = 2
    @State var timer: Timer?
    
    var body: some View {
        VStack{
            if exercises > 0 {
                if isTiming {
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
                            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
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
                                    exercises -= 1
                                    isTiming.toggle()
                                    self.timer?.invalidate()
                                    self.timer = nil
                                    
                                }
                            }
                        }
                }
                else { // exercicio de contagem
                    //Text("\(exerciseCount)")
                        //.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        //.onAppear(){
                          //  print("entrou")
                            
                        //}
                }
            }
            Image("Chart")
                .padding()
            
            HStack{
                Text("Prancha")
                Spacer()
            } .padding(.bottom,20)
        }
        .padding()
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
