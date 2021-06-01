//
//  WorkoutType.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 01/06/21.
//

import SwiftUI

struct WorkoutType: View {
    let dotSize: CGFloat = 13
    let dotColor = #colorLiteral(red: 0, green: 0.652125001, blue: 0.6788540483, alpha: 0.8470588235)
    var workoutName:String
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color(dotColor))
                .frame(width: dotSize, height: dotSize, alignment: .leading)
            
            Text(workoutName)
            Spacer()
        }
    }
}

struct WorkoutType_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutType(workoutName: "Name")
    }
}
