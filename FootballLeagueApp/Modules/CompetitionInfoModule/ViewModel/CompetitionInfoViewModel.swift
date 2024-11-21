//
//  CompetitionInfoViewModel.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 20/11/2024.
//

import Foundation
import RxCocoa
import RxSwift
class CompetitionInfoViewModel{
    var matchesArr:[Match]=[]{
        didSet{
            self.emitValues()
        }
    }
    var publishedObj = ReplaySubject<[Match]>.createUnbounded()
    var competition:Competition
    var noResult : ((String)->Void) = {_ in }
    var navigateForward : ((Match)->Void) = {_ in}
    var hideTableView:(Bool)->Void = {_ in}
    init(competition:Competition){
        self.competition = competition
    }
    func emitValues(){
        publishedObj.onNext(matchesArr)
        
    }
    func UIController(){
        DispatchQueue.main.async {
            if(self.matchesArr.count == 0){
                self.hideTableView(true)
                
            }else{
                self.hideTableView(false)
            }
        }
    }
    func getData(){
        Connection.shared.checkConnectivity { flag in
            if !flag {
                self.noResult(FootballError.noConnection.localizedDescription)
            }
            NetworkService.shared.fetchData(endPoint: "/\(self.competition.id)/matches", model: MatchesResponse.self) { result in
                switch result{
                case .success(let data) : self.matchesArr = data.matches;self.UIController()
                case .failure(let error): self.noResult(error.localizedDescription)
                    print(error.localizedDescription);self.UIController()
                }
            }
        }
        
    }
}
