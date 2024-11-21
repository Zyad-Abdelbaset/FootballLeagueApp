//
//  Decoder.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
class DataParser{
    //Using to Serlaize Data to specific Model
    static func parsingData<T: Decodable>(data:Data,model:T.Type,completion:(T?,FootballError?)->Void){
        do{
            let decodedData = try JSONDecoder().decode(model.self, from: data)
            completion(decodedData, nil)
        }catch _{
            completion(nil, .serializationError)
        }
    }
    
    
}
