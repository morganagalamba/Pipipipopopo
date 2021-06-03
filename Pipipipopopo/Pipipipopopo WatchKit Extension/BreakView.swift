//
//  CountdownView.swift
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
        
        Circle()
            .stroke(lineWidth: 8)
            .fill(Color(offWhite))
            .frame(width: 90, height: 90, alignment: .center)
        
        
        Circle()
            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: progress())
            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            .foregroundColor(completed() ? Color(darkGreen) : Color(lightGreen))
            .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .animation(Animation.linear(duration: 0.1))
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct BreakView: View {
    @State var counter: Int = 0
    var countTo: Int = 30
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
            }
            
            HStack{
                Text("Repouso")
                Spacer()
            }.padding()
            
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView()
    }
}
