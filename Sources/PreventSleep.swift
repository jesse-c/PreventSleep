//
//  PreventSleep.swift
//  PreventSleep
//
//  Created by Jesse Claven on 12/07/2016.
//  Copyright © 2016 Jesse Claven. All rights reserved.
//

import Foundation
import IOKit.pwr_mgt

public class PreventSleep {
    var sleepAssertionID: IOPMAssertionID? = IOPMAssertionID(0)
    var sleepAssertionType: String?
    var sleepAssertion: IOReturn?
    
    let sleepAssertionMsg: String?
    
    public init?(sleepAssertionMsg: String, sleepAssertionType: String) {
        // Check if the assertion type is valid
        if sleepAssertionType != kIOPMAssertionTypeNoIdleSleep &&
           sleepAssertionType != kIOPMAssertionTypeNoDisplaySleep {
           return nil
        }
        
        self.sleepAssertionMsg  = sleepAssertionMsg
        self.sleepAssertionType = sleepAssertionType
    }
    
    deinit {
        self.allowSleep()
    }
    
    // MARK: Power assertion handling
    
    // Prevent the computer going to sleep
    // Returns whether the power assertion was successful or not.
    public func preventSleep() -> Bool {
        self.sleepAssertion = IOPMAssertionCreateWithName(
            self.sleepAssertionType,
            IOPMAssertionLevel(kIOPMAssertionLevelOn),
            sleepAssertionMsg,
            &sleepAssertionID!
        )
        
        if self.sleepAssertion == kIOReturnSuccess {
            return true
        } else {
            return false
        }
    }
    
    // Allow the computer to go to sleep
    // Returns whether the power assertion was successful or not.
    public func allowSleep() -> Bool {
        let sleepAssertionRelease = IOPMAssertionRelease(self.sleepAssertionID!)
        
        if sleepAssertionRelease == kIOReturnSuccess {
            return true
        } else {
            return false
        }
    }
    
    // Can the computer go to sleep, or is it being prevented?
    public func canSleep() -> Bool {
        // Check if the assertion already exists
        if sleepAssertion == kIOReturnSuccess {
            return false
        } else {
            return true
        }
    }
}