//
//  SimpleEnergyVehicleDashboardApp.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import SwiftUI

@main
struct SimpleEnergyVehicleDashboardApp: App {
    var body: some Scene {
        
        let apiService = VehicleAPIService()
        
        let repository = VehicleRepository(apiService: apiService)
        
        let viewModel = VehicleListViewModel(repository: repository)
        
        WindowGroup {
            VehicleListView(viewModel: viewModel, repository: repository)
        }
    }
}
