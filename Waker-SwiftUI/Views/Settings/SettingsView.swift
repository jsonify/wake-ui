//
//  SettingsView.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/3/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State private var rainSoundEnabled = false
    @State private var clockEnabled = false
    
    var body: some View {
        Form {
            Section(header: Text("General")) {
                Text("Show Tutorial")
                
                NavigationLink(destination: ContentView()) {
                    Text("Rate This App")
                }
                
                
            }
            
            Section(header: Text("Audio")) {
                Toggle("Rain Sound Enabled", isOn: $rainSoundEnabled)
            }
            
            Section(header: Text("Visual")) {
                Toggle("Show Clock", isOn: $clockEnabled)
                
            }
        }
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
