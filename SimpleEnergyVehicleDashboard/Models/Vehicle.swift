//
//  Vehicle.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import Foundation

struct Vehicle: Identifiable, Codable {
    let id: Int
    let name: String
    let model: String
    let battery: Int
    let range: Int
    let speed: Int
    let odometer: Int
    let status: String
    let lastUpdated: String
}
