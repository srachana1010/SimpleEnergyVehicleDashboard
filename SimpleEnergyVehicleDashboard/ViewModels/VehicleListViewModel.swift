//
//  VehicleListViewModel.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import Foundation
import Observation

@Observable
final class VehicleListViewModel {
    
    var vehicles: [Vehicle] = []
    var isLoading = false
    var errorMessage: String?
    
    private let repository: VehicleRepositoryProtocol
    
    init (repository: VehicleRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchVehicles() async {
        isLoading = true
        errorMessage = nil
        
        do {
            vehicles = try await repository.fetchVehicles()
        } catch is CancellationError {
            return
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func refreshVehicles() async {
        errorMessage = nil
        
        do {
            vehicles = try await repository.fetchVehicles()
        } catch is CancellationError {
            return
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
