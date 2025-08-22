//
//  RNEventEmitter.swift
//  rnApp
//
//  Created by Rafaela Manta on 22/8/25.
//


import Foundation
import React

@objc(RNEventEmitter)
class RNEventEmitter: RCTEventEmitter {
    
    override func supportedEvents() -> [String]! {
        return []
    }
    
    @objc
    func sendDataToNative(_ params: NSDictionary) {
        print("=== DATA RECEIVED FROM JAVASCRIPT ===")
        print("Raw data:", params)
        
        // Convert NSDictionary to Swift dictionary for better display
        if let data = params as? [String: Any] {
            print("Formatted data:")
            for (key, value) in data {
                print("  \(key): \(value)")
            }
            
            // Send notification to update UI
            print("Sending notification to update UI...")
            DispatchQueue.main.async {
                NotificationCenter.default.post(
                    name: NSNotification.Name("JSDataReceived"),
                    object: data
                )
                print("Notification sent with data: \(data)")
            }
        }
        print("=====================================")
    }
}

