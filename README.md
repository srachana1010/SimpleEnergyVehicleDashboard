# Simple Energy Vehicle Dashboard

A small iOS application built using Swift and SwiftUI to display vehicle information fetched from a REST API.

## Features

- Vehicle list displaying:
  - Vehicle name
  - Model
  - Battery percentage
  - Estimated range
  - Online/Offline status
- Vehicle details screen
- Refresh vehicle details
- Pull-to-refresh on the vehicle list
- Loading and error states

## Architecture

The app follows a simple layered architecture:

```text
Views → ViewModels → Repository → API Service → REST API
```

The repository is exposed through `VehicleRepositoryProtocol` to keep the ViewModels independent of the API implementation.

## Project Structure

```text
SimpleEnergyVehicleDashboard/
│
├── SimpleEnergyVehicleDashboard/
│   ├── Models/
│   ├── Services/
│   ├── Repositories/
│   ├── ViewModels/
│   ├── Views/
│   └── SimpleEnergyVehicleDashboardApp.swift
│
├── MockAPI/
│   ├── vehicles.json
│   └── server.py
│
└── README.md
```

## Requirements

- macOS
- Xcode
- iOS Simulator
- Python 3

## Setup & Run

### 1. Start the Mock API

Navigate to the `MockAPI` directory:

```bash
cd MockAPI
```

Start the server:

```bash
python3 server.py
```

The API will run at:

```text
http://localhost:8000/vehicles
```

### 2. Run the iOS App

1. Open the Xcode project.
2. Select an iOS Simulator.
3. Build and run the application.

The app will fetch vehicle data from the local mock API.

## Assumptions

- The API returns a JSON array of vehicles.
- Each vehicle has a unique `id`.
- The local mock API runs on port `8000`.
- The application is intended to be run using the iOS Simulator.
- Vehicle data is stored in `vehicles.json` for this assignment.

## Known Limitations

- The application uses a local mock API instead of a production backend.
- The API runs on `localhost`, so it is intended for use with the iOS Simulator on the development Mac.
- Vehicle data is static and stored in `vehicles.json`.
- Changes made after refreshing a vehicle on the details screen are not automatically reflected in the vehicle list. The list can be manually refreshed using pull-to-refresh.
