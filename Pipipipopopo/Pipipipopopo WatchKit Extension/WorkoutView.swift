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
    @State var exerciseName: String = ""
    @State var timer: Timer?
    @State var workout : Workout = Workout(name: "Aeróbico", exercise: [Exercise(name: "Polichinelo", isTiming: true, count: 5, seconds: 10, minutes: 0, series: 1),Exercise(name: "Corrida estacionária", isTiming: true, count: 0, seconds: 30, minutes: 0 , series: 1)] )
    @State var auxExercises: Int = 0
    @State var auxSeries: Int = 0

    
    var body: some View {
        VStack{
            if auxExercises < workout.exercises.count {
                if workout.exercises[auxExercises].isTiming {

                    Text("\(zeroMinutes)\(minutes):\(zeroSeconds)\(seconds)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onAppear(){
                            self.seconds = workout.exercises[auxExercises].seconds
                            self.minutes = workout.exercises[auxExercises].minutes
                            
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
                                        seconds -= 1
                                    } else {
                                        seconds = 59
                                        minutes -= 1
                                        self.zeroSeconds = ""
                                    }
                                } else if minutes == 0 {
                                    if seconds > 0 {
                                        seconds -= 1
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
                                    //WKInterfaceDevice.current().play(.stop)
                                    self.auxSeries += 1
                                    if auxSeries == workout.exercises[auxExercises].series {
                                        self.auxExercises += 1
                                    }
                                    //self.timer?.invalidate()
                                    //self.timer = nil
                                }
                                
                            }
                        }
                    Image("Chart")
                        .padding()
                        
                    
                } else { // exercicio de contagem
                    Text("\(exerciseCount)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onAppear(){
                          print("entrou")
                            
                        }
                    
                }
            }
            HStack{
                Text("\(workout.exercises[auxExercises].name)")
                    .onChange(of: self.workout.exercises[auxExercises].name ) { newExercise in
                        switch newExercise {
                            case "Polichinelo" :
                                self.seconds = workout.exercises[auxExercises].seconds
                                self.minutes = workout.exercises[auxExercises].minutes
                            
                            case "Corrida estacionária" :
                                self.seconds = workout.exercises[auxExercises].seconds
                                self.minutes = workout.exercises[auxExercises].minutes
                            default:
                                self.seconds = workout.exercises[auxExercises].seconds
                                self.minutes = workout.exercises[auxExercises].minutes
                        }
                        
                        
                    }
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
