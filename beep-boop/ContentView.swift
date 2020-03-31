//
//  ContentView.swift
//  beep-boop
//
//  Created by Matt Wang on 2020-03-30.
//  Copyright © 2020 Matthew Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bleConnection = BLEConnection()
    var body: some View {
        NavigationView {
          VStack (alignment: .leading){
            Text("Peripheral Name").font(.title).foregroundColor(.purple)
            List (bleConnection.scannedBLEDevices) { device in
                Text("Name: \(device.name)  RSSI: \(String(device.rssi))")
            }
          }
          .padding()
          .navigationBarTitle("BLE Devices")
        }
        .onAppear(perform: startBLEScan)
      }
      
      private func startBLEScan(){
        bleConnection.startCentralManager()
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
