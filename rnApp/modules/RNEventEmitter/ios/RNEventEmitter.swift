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
    
    static var shared: RNEventEmitter?
    
    override init() {
        super.init()
        RNEventEmitter.shared = self
    }
    
    override func supportedEvents() -> [String]! {
        return ["DataFromNative"]
    }
    
    @objc static func sendDataToReactNative(_ data: [String: Any]) {
        DispatchQueue.main.async {
            shared?.sendEvent(withName: "DataFromNative", body: data)
        }
    }
    
    @objc
    func sendDataToNative(_ params: NSDictionary) {
        print("=== DATA RECEIVED FROM JAVASCRIPT ===")
        print("Raw data:", params)
        
        // Convert NSDictionary to Swift dictionary for better display
        if let data = params as? [String: Any] {
            // Send notification to update UI
            DispatchQueue.main.async {
                NotificationCenter.default.post(
                    name: NSNotification.Name("JSDataReceived"),
                    object: data
                )
            }
        }
    }
}

