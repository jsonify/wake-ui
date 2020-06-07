//
//  SettingsView.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/3/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showing: Bool
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text("Settings")
                        .font(.system(size: 24))
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .background(Color.red)
                        .foregroundColor(.white)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showing = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .offset(y: -10)
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 290)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
        }
    }
    
//    @State private var rainSoundEnabled = false
//    @State private var clockEnabled = false
//
//    var body: some View {
//        Form {
//            Section(header: Text("General")) {
//                Text("Show Tutorial")
//
//                NavigationLink(destination: ContentView()) {
//                    Text("Rate This App")
//                }
//
//
//            }
//
//            Section(header: Text("Audio")) {
//                Toggle("Rain Sound Enabled", isOn: $rainSoundEnabled)
//            }
//
//            Section(header: Text("Visual")) {
//                Toggle("Show Clock", isOn: $clockEnabled)
//
//            }
//        }
//        .navigationBarTitle("Settings", displayMode: .inline)
//    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showing: .constant(true), userData: UserData())
    }
}
