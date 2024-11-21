//
//  CompetitionDetailModel.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 20/11/2024.
//

import Foundation
// MARK: - MatchesResponse
struct MatchesResponse: Codable {
    let matches: [Match]
}
// MARK: - Match
struct Match: Codable {
    let id: Int
    let area: Area
    let season: Season
    let status: String
    let matchday: Int
    let stage: String
    let score: Score
    let homeTeam, awayTeam: Team
    let referees: [Referee]
}
struct Score: Codable {
    let winner: String?
    let duration: String
    let fullTime, halfTime: Time
}
struct Time: Codable {
    let home, away: Int?
}
struct Referee: Codable {
    let id: Int
    let name: String
    //let type: String
    let nationality: String?
}
// MARK: - Area
struct Area: Codable {
    let id: Int
    let name: String
    let code: String
    let flag: String?
}
// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
    //let winner: String?
}
// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}

