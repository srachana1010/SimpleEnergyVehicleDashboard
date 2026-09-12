//
//  VehicleRowView.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import SwiftUI

struct VehicleRowView: View {
    
    let vehicle: Vehicle
    
    private var isOnline: Bool {
        vehicle.status.uppercased() == "ONLINE"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(vehicle.name)
                        .font(.headline)
                    
                    Text(vehicle.model)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                HStack(spacing: 6) {
                    Circle()
                        .fill(isOnline ? .green: .red)
                        .frame(width: 8, height: 8)
                    
                    Text(isOnline ? "Online" : "Offline")
                        .font(.caption)
                        .fontWeight(.medium)
                    
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Battery")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text("\(vehicle.battery)%")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Range")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text("\(vehicle.range) km")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding(.vertical, 8)
    }
}
