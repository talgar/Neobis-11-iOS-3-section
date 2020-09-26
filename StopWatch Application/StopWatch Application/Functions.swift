//
//  Functions.swift
//  StopWatch Application
//
//  Created by admin on 27.09.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import Foundation

func timeString(time: TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minute = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    
    return String(format:"%02i:%02i:%02i", hours,minute,seconds)
}
