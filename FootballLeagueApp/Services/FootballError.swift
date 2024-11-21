//
//  FootballError.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
enum FootballError: Error, CustomNSError {
    case invalidResponse
    case invalidEndPoint
    case apiError
    case noData
    case serializationError
    case noConnection
    var localizedDescription: String {
        switch self {
        case .invalidResponse: return "Invalid response code"
        case .noData: return "there is No data (Empty data)"
        case .serializationError: return "Failed in decoding data"
        case .invalidEndPoint: return "Not a valid End Point"
        case .apiError: return "Problem in connecting with API"
        case .noConnection: return "the internet connection maybe lost or weak(Offline mode)"
        }
    }
    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
