//
//  VehicleListView.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import SwiftUI

struct VehicleListView: View {
    
    private let viewModel: VehicleListViewModel
    private let repository: VehicleRepositoryProtocol
    
    init(viewModel: VehicleListViewModel, repository: VehicleRepositoryProtocol) {
        self.viewModel = viewModel
        self.repository = repository
    }
    
    var body: some View {
        
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Vehicles...")
                } else if let errorMessage = viewModel.errorMessage {
                    
                    VStack(spacing: 12) {
                        Text("Something went wrong")
                            .font(.headline)
                        
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    List(viewModel.vehicles) { vehicle in
                        
                        NavigationLink {
                            VehicleDetailsView(vehicle: vehicle, repository: repository)
                        } label: {
                            VehicleRowView(vehicle: vehicle)
                        }
                    }
                    .refreshable {
                        await viewModel.refreshVehicles()
                    }
                }
            }
            .navigationTitle("My Vehicles")
        }
        .task {
            await viewModel.fetchVehicles()
        }
    }
}
