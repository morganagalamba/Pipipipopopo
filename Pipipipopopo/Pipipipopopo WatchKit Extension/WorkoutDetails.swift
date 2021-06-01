//
//  WorkoutDetails.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 31/05/21.
//

import SwiftUI

struct WorkoutDetails: View {
    var body: some View {
        let buttonColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        NavigationView {
            ZStack {
                ScrollView {
                    
                    VStack (alignment: .leading){
                        Group {
                            Text("Polichinelo")
                                .font(.headline)
                            Text("1 série")
                                .font(.subheadline)
                            Text("5 repetições")
                                .font(.subheadline)
                            Divider()
                        }
                        
                        Group {
                            Text("Corrida estacionária")
                                .font(.headline)
                            Text("2 séries")
                                .font(.subheadline)
                            Text("30 segundos")
                                .font(.subheadline)
                            Divider()
                        }
                        
                        Group {
                            Text("Agachamento")
                                .font(.headline)
                            Text("1 série")
                                .font(.subheadline)
                            Text("5 repetições")
                                .font(.subheadline)
                            Divider()
                        }
                        
                        Group {
                            Text("Prancha")
                                .font(.headline)
                            Text("2 séries")
                                .font(.subheadline)
                            Text("30 segundos")
                                .font(.subheadline)
                            Divider()
                        }
                        
                    }
                    
                }
                VStack {
                    Spacer()
                    NavigationLink(destination: WorkoutView()) {
                        Text("Começar")
                            .foregroundColor(.black)
                    }
                    .background(Color(buttonColor))
                    .cornerRadius(8.0)
                }
            }.navigationTitle("Aeróbico")
        }
    }
}

struct WorkoutDetails_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetails()
    }
}
