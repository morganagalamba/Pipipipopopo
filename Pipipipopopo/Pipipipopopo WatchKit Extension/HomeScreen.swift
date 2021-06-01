//
//  HomeScreen.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 31/05/21.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        let dotSize: CGFloat = 13
        NavigationView{
            ScrollView {
                VStack {
                    Button(action: {
                        print("entrou no botao")
                        NavigationLink(destination: WorkoutDetails()) {
                            Text("treino aeróbico")
                        }
                        print("entrou no botao")

                    }) {
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: dotSize, height: dotSize, alignment: .leading)
                            Text("Aeróbico")
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: dotSize, height: dotSize, alignment: .leading)
                            
                            Text("HIIT")
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Circle()
                                .fill(Color.pink)
                                .frame(width: dotSize, height: dotSize, alignment: .leading)
                            
                            Text("Pernas")
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: dotSize, height: dotSize, alignment: .leading)
                            
                            Text("Abdômen")
                            Spacer()
                        }
                    }
                    
                }
                
            }
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
