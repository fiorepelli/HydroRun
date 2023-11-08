//
//  ContentView.swift
//  HydroRun
//
//  Created by Antonio Tridente on 30/10/23.
//

import SwiftUI
import MapKit
import CoreLocation

@main
struct HydroRunApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    
    @State private var selection: Int = 0
    @State var timerAndKm = false
    @State var pauseTimer = true
    
    @State var saveData = false
    @State var savedTime = ""
    @State var savedKilometers = 0.0
    @State var nroFontanelle = 2
    
    var body: some View {
       
        TabView(selection: $selection){
            ZStack {
                VStack {
                    MostraMappaFontEPos()
                    BottoneStart(timerAndKm: $timerAndKm, pauseTimer: $pauseTimer, saveDataflag: $saveData, savedTime: $savedTime, savedKilometers: $savedKilometers)
                        .padding(10)
                }
                
                if timerAndKm {
                    TimerAndKm(pauseTimer: $pauseTimer, saveData: $saveData, savedTime: $savedTime, savedKilometers: $savedKilometers)
                        .position(x: 197, y:50)
                }

                if timerAndKm{
                    ButtonMaps()
                        .position(x: 350, y: 158)
                } else {
                    ButtonMaps()
                        .position(x: 350, y: 90)
                }
            }
            .tabItem {
                Image(systemName: "figure.run")
                Text("Run")
            }
            .tag(2)
            
            Historical()
            .tabItem {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                Text("Historical")
            }
            .tag(1)
        }
        .accentColor(.orange)
    }

    let locationManager = CLLocationManager()
    

}


#Preview {
    ContentView()
}















