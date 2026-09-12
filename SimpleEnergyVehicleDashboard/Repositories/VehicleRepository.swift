//
//  VehicleRepository.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import Foundation

final class VehicleRepository: VehicleRepositoryProtocol {
    
    private let apiService: VehicleAPIService
    
    init(apiService: VehicleAPIService) {
        self.apiService = apiService
    }
    
    func fetchVehicles() async throws -> [Vehicle] {
        try await apiService.fetchVehicles()
    }
}
