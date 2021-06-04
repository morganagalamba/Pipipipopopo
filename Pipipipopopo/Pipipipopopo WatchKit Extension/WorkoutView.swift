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
    //@State var series: Int = 2
    //@State var isTiming: Bool = true
    //@State var exerciseCount: Int = 5
    @State var timer: Timer?
    var exerciseName : String
    var ExerciseSeconds : Int
    var ExerciseMinutes : Int
    //@State var workout : Workout = Workout(name: "Aeróbico", exercises: [Exercise(name: "Polichinelo", isTiming: true, count: 5, seconds: 10, minutes: 0, series: 1),Exercise(name: "Corrida estacionária", isTiming: true, count: 0, seconds: 30, minutes: 0 , series: 1)] )
    //@State var auxExercises: Int = 0
    //@State var auxSeries: Int = 0
    
    var body: some View {
        VStack{
                    Text("\(zeroMinutes)\(minutes):\(zeroSeconds)\(seconds)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onAppear(){
                            self.seconds = ExerciseSeconds
                            self.minutes = ExerciseMinutes
                            if minutes < 10 {
                                self.zeroMinutes = "0"
                            } else {
                                self.zeroMinutes = ""
                            }
                            if seconds < 10 {
                                self.zeroSeconds = "0"
                            } else {
                                self.zeroSeconds = ""
                                
                            }
                            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
                                _ in
                                if minutes > 0 {
                                    if seconds > 0 {
                                        self.seconds -= 1
                                    } else {
                                        self.seconds = 59
                                        minutes -= 1
                                        self.zeroSeconds = ""
                                    }
                                } else if minutes == 0 {
                                    if seconds > 0 {
                                        self.seconds -= 1
                                    }
                                }
                                if minutes < 10 {
                                    self.zeroMinutes = "0"
                                } else {
                                    self.zeroMinutes = ""
                                }
                                if seconds < 10 {
                                    self.zeroSeconds = "0"
                                }
                                
                                if seconds == 0 && minutes == 0 {
                                    WKInterfaceDevice.current().play(.stop)
                                    /*self.auxSeries += 1
                                    if auxSeries == workout.exercises[auxExercises].series {
                                        self.auxExercises += 1
                                    }*/
                                    self.timer?.invalidate()
                                    self.timer = nil
                                }
                                
                            }
                        }
                    AnimationWithTimer()
                        .padding()
            HStack{
                Text("\(exerciseName)")
                Spacer()
            }
            
        }
        .padding()
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(exerciseName: "Polichinelo", ExerciseSeconds: 10, ExerciseMinutes: 0)
    }
}
