//
//  WakeScreenDuration.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/5/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct WakeScreenDurationSettingsView: View {
    @Binding var showing: Bool
    @ObservedObject var userData: UserData
        
    @State private var selectedTime = 3
    let times = [5, 10, 15, 20, 25, 30, 45, 60]
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text("Wake Screen Duration")
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
                
                Picker("Time Selection", selection: $userData.wakeScreenDuration) {
                    ForEach(self.times, id: \.self) { time in
                        Text("\(time) min")
                    }
                }
                .offset(y: -20)
                .labelsHidden()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 290)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
        }
    }
}

struct WakeScreenDurationSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WakeScreenDurationSettingsView(showing: .constant(true), userData: UserData())
    }
}
