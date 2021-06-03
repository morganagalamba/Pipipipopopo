//
//  Workouts.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Morgana Galamba on 02/06/21.
//

import Foundation

public class Workout{
    
    var name: String
    var exercises : [Exercise]
     
    init(name: String , exercises: [Exercise] ) {
        self.name = name
        self.exercises = exercises
    }
    
}

public struct Exercise {
    
    var name: String
    var isTiming: Bool
    var count: Int
    var seconds: Int
    var minutes: Int
    var series : Int
}
