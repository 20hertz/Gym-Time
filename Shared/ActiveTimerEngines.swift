//
//  ActiveTimerEngines.swift
//  Gym Time
//
//  Created by Stéphane on 2025-01-13.
//

import Foundation

/// Example of a global "active engine" storage.
/// In a production app, you might integrate this differently.
public class ActiveTimerEngines {
    public static let shared = ActiveTimerEngines()
    
    private var engines: [UUID: TimerEngine] = [:]
    
    private init() {}
    
    /// Returns an existing engine for the given timer config, or creates one if none exist.
    public func engine(for timer: IntervalTimer) -> TimerEngine {
        if let existing = engines[timer.id] {
            return existing
        } else {
            let newEngine = TimerEngine(timer: timer)
            engines[timer.id] = newEngine
            return newEngine
        }
    }
}
