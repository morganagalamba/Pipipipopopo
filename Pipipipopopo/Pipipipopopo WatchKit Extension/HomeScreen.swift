//
//  HomeScreen.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 31/05/21.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: WorkoutDetails()) {
                        WorkoutType(workoutName: "Aeróbico")
                    }
                    
                    NavigationLink(destination: WorkoutDetails()) {
                        WorkoutType(workoutName: "HIIT")
                    }
                    
                    NavigationLink(destination: WorkoutDetails()) {
                        WorkoutType(workoutName: "Abdômen")
                    }
                    
                    NavigationLink(destination: WorkoutDetails()) {
                        WorkoutType(workoutName: "Pernas")
                    }
                }
            }
        }.navigationTitle("Treinos")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
