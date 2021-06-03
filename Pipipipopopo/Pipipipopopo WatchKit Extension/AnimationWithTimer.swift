//
//  AnimationWithTimer.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 03/06/21.
//


import SwiftUI


let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.title3)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    let offWhite = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    let lightGreen = #colorLiteral(red: 0.03137254902, green: 0.5921568627, blue: 0.6156862745, alpha: 1)
    let darkGreen = #colorLiteral(red: 0.01960784314, green: 0.3568627451, blue: 0.3607843137, alpha: 1)
    
    var body: some View {
        
        
        RoundedRectangle (cornerRadius: 20)
            .fill(completed() ? Color(lightGreen) : Color(darkGreen))
            .frame(width: 7, height: completed() ? CGFloat.random(in: 45..<75) : CGFloat.random(in: 55..<75))
            .animation(Animation.easeIn(duration: Double.random(in: 0.5..<1.0)))
//            .animation(
//                Animation.linear(duration: Double.random(in: 0.9..<1.3))
//                    .repeatCount(5, autoreverses: true)
//            )
            .offset(y: completed() ? CGFloat.random(in: -20..<20) : CGFloat.random(in: -20..<20))
    }
    
    
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}



struct AnimationWithTimer: View {
    @State var counter: Int = 0
    var countTo: Int = 2
    
    var body: some View {
        HStack(spacing: 20){
            ProgressBar(counter: counter, countTo: countTo)
            ProgressBar(counter: counter, countTo: countTo)
            ProgressBar(counter: counter, countTo: countTo)
            ProgressBar(counter: counter, countTo: countTo)
            ProgressBar(counter: counter, countTo: countTo)
            ProgressBar(counter: counter, countTo: countTo)
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}

struct AnimationWithTimer_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithTimer()
    }
}
