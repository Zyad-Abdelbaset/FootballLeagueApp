//
//  CompetitionViewModel.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
import RxSwift
import RxCocoa
class CompetitionViewModel{
    var competiionArr:[Competition]=[]{
        didSet{
            self.emitValues()
        }
    }
    var publishedObj = PublishSubject<[Competition]>()
    var noResult : ((String)->Void) = {_ in }
    var navigateForward : ((Competition)->Void) = {_ in}
    var hideTableView:(Bool)->Void = {_ in}
    
    func getCompetition(){
        Connection.shared.checkConnectivity { connection in
            if(!connection){
                self.noResult(FootballError.noConnection.localizedDescription)
            }
            NetworkService.shared.fetchData(endPoint: "", model: CompetitionResponse.self) { result in
                switch result{
                case .success(let data) : self.competiionArr = data.competitions;
                case .failure(let error): self.noResult(error.localizedDescription)
                    self.UIController()
                }
            }
        }
    }
    func UIController(){
        DispatchQueue.main.async {
            if(self.competiionArr.count == 0){
                self.hideTableView(true)
                
            }else{
                self.hideTableView(false)
            }
        }
    }
    func emitValues(){
        publishedObj.onNext(competiionArr)
        UIController()
    }
}
