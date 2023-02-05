//: [Previous](@previous)

import Foundation
import SwiftUI

var enterForegroundTask: Task<Void, Never>?

func check() {
    let notificationCenter = NotificationCenter.default
    
    enterForegroundTask = Task {
        let willEnterForeground = await notificationCenter.notifications(named: UIApplication.willEnterForegroundNotification)
        
        
        for await notification in willEnterForeground {
            print(notification)
        }
    }
}

func cleanup() {
    enterForegroundTask?.cancel()
}


check()

cleanup()
