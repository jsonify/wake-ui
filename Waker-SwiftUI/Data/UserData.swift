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

    
    @Published var preWakeDuration: Int {
        didSet {
            
            UserDefaults.standard.set(preWakeDuration, forKey: Self.preWakeDurationKey)
        }
    }
    
    init() {
        preWakeDuration = UserDefaults.standard.integer(forKey: Self.preWakeDurationKey) 
    }
    
    @Published var wakeScreenDuration: Int  = UserDefaults.standard.integer(forKey: "wakeScreenDuration") {
           didSet {
               UserDefaults.standard.set(self.wakeScreenDuration, forKey: "wakeScreenDuration")
           }
           
           willSet {
               objectWillChange.send()
           }
           
       }
    
    
}
