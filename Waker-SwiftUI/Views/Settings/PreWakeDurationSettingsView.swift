//
//  PreWakeTimeSettingsView.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/4/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct PreWakeDurationSettingsView: View {
    @ObservedObject var userData = UserData()
    let times = [5, 10, 15, 20, 25, 30, 45, 60]
    @State private var selectedTime = 3
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text("Pre Wake Duration")
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .background(Color.red)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        
                    }) {
                        Text("Save")
                    }
                }
                
                Picker("Time Selection", selection: $userData.preWakeDuration) {
                    ForEach(self.times, id: \.self) { time in
                        Text("\(time) min")
                    }
                }
                .offset(y: -20)
                .labelsHidden()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
        }
    }
}

struct PreWakeTimeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PreWakeDurationSettingsView()
    }
}
