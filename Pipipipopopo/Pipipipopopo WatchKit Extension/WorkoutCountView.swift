//
//  WorkoutCountView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Morgana Galamba on 03/06/21.
//

import SwiftUI

struct WorkoutCountView: View {
    var exerciseName : String
    var exerciseCount : Int
    @State var count : Int = 0
    @State var timer: Timer?
    @State var timerCount = 0
    @State var finish = false
    var body: some View {
        VStack{
            Text("\(count)/\(exerciseCount)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onAppear(){
                    self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){_ in
                        
                        if count < exerciseCount {
                            count += 1
                        }
                        
                        
                        if count == exerciseCount {
                            
                            WKInterfaceDevice.current().play(.stop)
                            finish = true
                            self.timer?.invalidate()
                            self.timer = nil
                        }
                    }
                    
                }
            Image("Chart")
            Spacer()
            HStack{
                Text("\(exerciseName)")
                    .bold()
                Spacer()
            }
            
        }
    }
}

struct WorkoutCountView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCountView(exerciseName: "Polichinelo", exerciseCount: 10)
    }
}
