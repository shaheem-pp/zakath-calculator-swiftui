//
//  ZakatRecord.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import Foundation
import SwiftData

@Model
final class ZakatRecord {
    var year: Int
    var netWorth: Double
    var zakatAmount: Double
    var calculationDate: Date
    
    var user: User?
    
    init(year: Int,
         netWorth: Double,
         zakatAmount: Double,
         calculationDate: Date = .now) {
        self.year = year
        self.netWorth = netWorth
        self.zakatAmount = zakatAmount
        self.calculationDate = calculationDate
    }
}
