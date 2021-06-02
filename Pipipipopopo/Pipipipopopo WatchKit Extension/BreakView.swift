//
//  BreakView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 02/06/21.
//

import SwiftUI

struct BreakView: View {
    
    var timerDuration: Double = 30.0
    @State private var progress: Double = 0.0
    
    var body: some View {
        
        
        let offWhite = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        let green = #colorLiteral(red: 0.03137254902, green: 0.5921568627, blue: 0.6156862745, alpha: 1)
        
        VStack {
            Spacer()
            
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 8)
                    .fill(Color(offWhite))
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text(String(format: "%.0f%%", min(self.progress, 1) * 100))
                    .font(.title3)
                    
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(self.progress))
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(green))
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .animation(Animation.linear(duration: timerDuration))
        
                    .onAppear(){
                        
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            progress += 0.1
                            if self.progress >= 1.0 {
                                timer.invalidate()
                            }
                        }
                    }
            }
           
            HStack{
                Text("Repouso")
                Spacer()
            }
            .padding()
                
        }
    }
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView()
    }
}
