//
//  File.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 07/02/2023.
//
import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    @Published private(set) var isConnected = false
    
    private let nwMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue.global()
    
    init() {
        nwMonitor.start(queue: workerQueue)
        nwMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
    }
    
    public func stop() {
        nwMonitor.cancel()
    }
}
