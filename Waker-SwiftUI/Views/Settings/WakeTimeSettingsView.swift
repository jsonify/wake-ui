//
//  WakeTimeSettingsView.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/4/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct WakeTimeSettingsView: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }

    @State private var wakeTime = Date()
    
    @Binding var showing: Bool
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text("Wake Time Settings")
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
                
                DatePicker(selection: $wakeTime, in: ...Date(), displayedComponents: .hourAndMinute) {
                    Text("")
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
}

struct WakeTimeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WakeTimeSettingsView(showing: .constant(true), userData: UserData())
    }
}
