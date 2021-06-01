//
//  PipipipopopoApp.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 28/05/21.
//

import SwiftUI

@main
struct PipipipopopoApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                //WorkoutView()
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
