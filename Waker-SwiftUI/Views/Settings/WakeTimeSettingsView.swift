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
    
    var body: some View {
        VStack {
            Text("Wake Time Settings")
                .font(.title)
            
            DatePicker(selection: $wakeTime, in: ...Date(), displayedComponents: .hourAndMinute) {
                Text("")
            }

            Text("Wake time is \(wakeTime, formatter: dateFormatter)")
            Spacer()
        }
        .padding(.top, 60)
    }
}

struct WakeTimeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WakeTimeSettingsView()
    }
}
