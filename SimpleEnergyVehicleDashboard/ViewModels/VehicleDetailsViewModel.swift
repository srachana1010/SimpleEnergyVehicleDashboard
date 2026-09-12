//
//  VehicleDetailsViewModel.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import Observation
import Foundation

@Observable
final class VehicleDetailsViewModel {
    
    var vehicle: Vehicle
    var isLoading = false
    var errorMessage: String?
    
    private let repository: VehicleRepositoryProtocol
    
    init(vehicle: Vehicle, repository: VehicleRepositoryProtocol) {
        self.vehicle = vehicle
        self.repository = repository
    }
    
    func refresh() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let vehicles = try await repository.fetchVehicles()
            
            if let updatedVehicle = vehicles.first(where: { $0.id == vehicle.id }) {
                vehicle = updatedVehicle
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
