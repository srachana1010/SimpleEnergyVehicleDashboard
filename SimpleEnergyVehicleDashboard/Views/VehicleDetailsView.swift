//
//  VehicleDetailsView.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import SwiftUI

struct VehicleDetailsView: View {
    
    private var formattedLastUpdated: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let date = formatter.date(from: viewModel.vehicle.lastUpdated) else {
            return viewModel.vehicle.lastUpdated
        }
        
        formatter.dateFormat = "dd MM yyyy, hh:mm a"
        return formatter.string(from: date)
    }
    
    
    private let viewModel: VehicleDetailsViewModel
    
    init(vehicle: Vehicle, repository: VehicleRepositoryProtocol) {
        self.viewModel = VehicleDetailsViewModel(
            vehicle: vehicle, repository: repository
        )
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(viewModel.vehicle.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(viewModel.vehicle.model)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
                
                VStack(spacing: 0) {
                    detailRow(title: "Battery", value: "\(viewModel.vehicle.battery)%")
                    Divider()
                    detailRow(title: "Estimated Range", value: "\(viewModel.vehicle.range) km")
                    Divider()
                    detailRow(title: "Current Speed", value: "\(viewModel.vehicle.speed) km/h")
                    Divider()
                    detailRow(title: "Odometer", value: "\(viewModel.vehicle.odometer) km")
                    Divider()
                    detailRow(title: "Connectivity", value: viewModel.vehicle.status.capitalized)
                    Divider()
                    detailRow(title: "Last Updated", value: formattedLastUpdated)
                }
                .padding()
                .background(.gray.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
                
                Button {
                    Task {
                        await viewModel.refresh()
                    }
                } label: {
                    HStack {
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            Image(systemName: "arrow.clockwise")
                        }
                        
                        Text(viewModel.isLoading ? "Refreshing..." : "Refresh")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.isLoading)
            }
            .padding()
        }
        .navigationTitle("Vehicle Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func detailRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(value)
                .fontWeight(.semibold)
        }
        .padding(.vertical, 12)
    }
}
