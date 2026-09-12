//
//  VehicleAPIService.swift
//  SimpleEnergyVehicleDashboard
//
//  Created by Rachana on 12/09/26.
//

import Foundation

final class VehicleAPIService {
    
    private let baseURL = "http://localhost:8000/vehicles"
    
    func fetchVehicles() async throws -> [Vehicle] {
        
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let vehicles = try JSONDecoder().decode([Vehicle].self, from: data)
        
        return vehicles
        
        
    }
}
