//
//  Date + extension.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import Foundation

extension Date { static func - (lhs: Date, rhs: Date) -> TimeInterval { return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate }
    
}
