//
//  VehicleRepositoryProtocol.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import Foundation

protocol VehicleRepositoryProtocol {
    func fetchVehicles() async throws -> [Vehicle]
}
