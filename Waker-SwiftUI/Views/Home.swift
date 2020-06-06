//
//  Home.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/3/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State private var wakeTimeSettingShowing = false
    @State private var showPreWakeSettings = false
    @State private var showWakeScreenSettings = false
    
    @ObservedObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TimeSelector(title: "Wake Up Time", time: "12:00 am".uppercased())
                        .background(Color(#colorLiteral(red: 0.03529411765, green: 0.2235294118, blue: 0.2784313725, alpha: 1)))
                        .onTapGesture {
                            self.wakeTimeSettingShowing.toggle()
                    }
                    .sheet(isPresented: $wakeTimeSettingShowing) {
                        WakeTimeSettingsView()
                    }
                    
                    VStack {
                        Text("PreWake Duration")
                        Text("\(userData.preWakeDuration) min")
                            .font(.title)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(#colorLiteral(red: 0.08235294118, green: 0.4745098039, blue: 0.4784313725, alpha: 1)))
                    .onTapGesture {
                        self.showPreWakeSettings.toggle()
                    }
                    
                    VStack {
                        Text("Wake Up Screen Duration")
                        Text("\(userData.wakeScreenDuration) min")
                            .font(.title)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(#colorLiteral(red: 0.5058823529, green: 0.6235294118, blue: 0, alpha: 1)))
                    .onTapGesture {
                        self.showWakeScreenSettings.toggle()
                    }
                    .sheet(isPresented: self.$showWakeScreenSettings) {
                            WakeScreenDurationSettingsView()
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 75)
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 0.8901960784, green: 0.6, blue: 0, alpha: 1)))
                    }
                    NavigationLink(destination: ContentView()) {
                        Text("Start")
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 175)
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 0.7843137255, green: 0.2078431373, blue: 0.3058823529, alpha: 1)))
                    }
                    
                }
                .navigationBarHidden(true)
                .navigationBarTitle(Text(""))
                .edgesIgnoringSafeArea([.top, .bottom])
                
                PreWakeDurationSettingsView()
                    .offset(y: showPreWakeSettings ? 0 : 600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TimeSelector: View {
    var title: String
    var time: String
    
    var body: some View {
        VStack {
            Text("\(title)")
            Text("\(time)")
                .font(.title)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
