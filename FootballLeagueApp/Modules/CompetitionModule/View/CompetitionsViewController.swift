//
//  CompetitionsViewController.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import UIKit
import RxSwift
import RxCocoa
class CompetitionsViewController: UIViewController {
    @IBOutlet weak var imgViewNoData: UIImageView!
    
    var disbodeBag = DisposeBag()
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    var competitionViewModel:CompetitionViewModel = CompetitionViewModel()
    @IBOutlet weak var competitionTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingupVM()
        registerNibFile()
        activityIndicator.setupActivityIndicator(in: self.view)
        activityIndicator.showActivityIndicator()
        imgViewNoData.isHidden = true
        competitionTableView.isHidden = true
        subscribeTableView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Competitions"
        competitionViewModel.getCompetition()
    }
}
//MARK: SettinfUp ViewController
extension CompetitionsViewController{
    //Register nib file
    func registerNibFile(){
        let nib = UINib(nibName: "CompetitionCell", bundle: nil)
        competitionTableView.register(nib, forCellReuseIdentifier: "CompetitionCell")
        competitionTableView.rowHeight = 120
    }
    // settingup the closures inside ViewModel
    func settingupVM(){
        //Navigate Closure
        self.competitionViewModel.navigateForward = {competition in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompetitionInfoTableViewController") as! CompetitionInfoTableViewController
            vc.competitionInfoViewModel = CompetitionInfoViewModel(competition: competition)
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        // Error Closure
        self.competitionViewModel.noResult = {error in
            self.presentAlert(title: "Warning", message: error, buttonTitle: "Ok")
            
        }
        // Hiding TV Closure
        self.competitionViewModel.hideTableView = {flag in
            self.imgViewNoData.isHidden = !flag
            self.competitionTableView.isHidden = flag
            self.activityIndicator.hideActivityIndicator()
        }
        
    }
    //Subscribe TV to Publisher
    func subscribeTableView(){
        //Binding Data
        competitionViewModel.publishedObj.bind(to: competitionTableView.rx.items(cellIdentifier: "CompetitionCell", cellType: CompetitionCell.self)){row, item, cell in
            cell.viewModel = CompetitionCellViewModel(competition: self.competitionViewModel.competiionArr[row])
            cell.putData()
        }.disposed(by: disbodeBag)
        //interact to Press
        competitionTableView.rx.itemSelected.subscribe(onNext: { indexPath in
            self.competitionViewModel.navigateForward(self.competitionViewModel.competiionArr[indexPath.row])
        }).disposed(by: disbodeBag)
    }
    
    
}
