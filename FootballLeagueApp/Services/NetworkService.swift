//
//  NetworkService.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
class NetworkService{
    static var shared = NetworkService()
    private let baseUrl = "https://api.football-data.org/v4/competitions"
    private let apiKey = "0f69eeb34a0f4445bf83432060025490"
    private init(){}
    
    func fetchData<T: Codable>(endPoint:String,model:T.Type,completion: @escaping (Result<T, FootballError>) -> Void) {
        // URL
        guard let url = URL(string: "\(baseUrl)\(endPoint)") else { completion(.failure(.apiError)); return  }
        // Request and force cache it
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        // Add the API token to the headers
        request.setValue(apiKey, forHTTPHeaderField: "X-Auth-Token")

        //DataTask
        URLSession.shared.dataTask(with: request) { data, response, error in
            //check Error
            if error != nil{
                completion(.failure(.apiError))
                return
            }
            //check data response
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            print(data.base64EncodedData(options: .lineLength64Characters))
            DataParser.parsingData(data: data,model: model.self) { FootballResponse, error in
                if let error = error{
                    completion(.failure(error))
                    return
                }
                completion(.success(FootballResponse!))
            } 
        }.resume()
    }
}
