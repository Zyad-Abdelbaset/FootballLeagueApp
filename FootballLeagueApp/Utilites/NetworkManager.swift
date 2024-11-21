//
//  NetworkManager.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
import Network

protocol ConnectionProtocol {
    func checkConnectivity(compilation: @escaping(Bool)->())
}
// Checking connection of Internet
class Connection: ConnectionProtocol {
    static let shared = Connection()
    private init() {}
    
    func checkConnectivity(compilation: @escaping(Bool)->()) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            let status = path.status == .satisfied
            DispatchQueue.main.async {
                compilation(status)
            }
            monitor.cancel()
        }
        monitor.start(queue: .main)
    }
}
