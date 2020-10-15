//
//  Functions.swift
//  StopWatch Application
//
//  Created by admin on 27.09.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import Foundation

extension Int {
    func timeString() -> String {
        let hours = Int(self) / 3600
        let minute = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return String(format:"%02i:%02i:%02i", hours,minute,seconds)
    }
    
}


