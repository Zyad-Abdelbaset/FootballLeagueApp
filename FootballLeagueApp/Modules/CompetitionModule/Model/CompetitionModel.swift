//
//  CompetitionModel.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
// MARK: - CompetitionResponse
struct CompetitionResponse: Codable {
    let competitions: [Competition]
    enum CodingKeys: CodingKey {
        case competitions
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.competitions = try container.decode([Competition].self, forKey: .competitions)
    }
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let name: String
    let code: String?
    let type: String?
    let emblem: String?
    let currentSeason: CurrentSeason?
    let numberOfAvailableSeasons: Int
}


// MARK: - CurrentSeason
struct CurrentSeason: Codable {
    let id: Int
    let currentMatchday: Int?
}
