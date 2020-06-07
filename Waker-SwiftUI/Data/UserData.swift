//
//  UserData.swift
//  Waker-SwiftUI
//
//  Created by Jason Rueckert on 6/5/20.
//  Copyright © 2020 Jason Rueckert. All rights reserved.
//
import Combine
import SwiftUI

class UserData: ObservableObject {
    @Published var wakeUpTime: Date = UserDefaults.standard.object(forKey: "wakeUpTime") as? Date ?? Date() {
        didSet {
            UserDefaults.standard.set(self.wakeUpTime, forKey: "wakeUpTime")
            self.objectWillChange.send()
        }
    }
    
    static let preWakeDurationKey = "preWakeDuration"
    static let wakeScreenDurationKey = "wakeScreenDuration"
    static let rainSoundEnabled = "rainSoundEnabled"
    static let showClock = "showClock"

    
    @Published var preWakeDuration: Int {
        didSet {
            
            UserDefaults.standard.set(preWakeDuration, forKey: Self.preWakeDurationKey)
        }
    }
    
    
    @Published var wakeScreenDuration: Int {
           didSet {
            UserDefaults.standard.set(self.wakeScreenDuration, forKey: Self.wakeScreenDurationKey)
           }
           
       }
    
    @Published var rainSoundEnabled: Bool {
        didSet {
            UserDefaults.standard.set(rainSoundEnabled, forKey: Self.rainSoundEnabled)
        }
    }
    
    @Published var showClock: Bool {
        didSet {
            UserDefaults.standard.set(showClock, forKey: Self.showClock)
        }
    }
    
    init() {
        preWakeDuration = UserDefaults.standard.integer(forKey: Self.preWakeDurationKey)
        wakeScreenDuration = UserDefaults.standard.integer(forKey: Self.wakeScreenDurationKey)
        rainSoundEnabled = UserDefaults.standard.bool(forKey: Self.rainSoundEnabled)
        showClock = UserDefaults.standard.bool(forKey: Self.showClock)
        
    }
    
}
