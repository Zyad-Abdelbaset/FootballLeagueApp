//
//  CompetitionInfoTableViewController.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 20/11/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class CompetitionInfoTableViewController: UITableViewController {
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var matchesTableView: UITableView!
    @IBOutlet weak var competitionTypeLbl: UILabel!
    @IBOutlet weak var competitionCodeLbl: UILabel!
    @IBOutlet weak var competitionNameLbl: UILabel!
    @IBOutlet weak var competitionImgView: UIImageView!
    var disposeBag = DisposeBag()
    var competitionInfoViewModel:CompetitionInfoViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpVC()
        addingNibFile()
        settingUpVM()
        activityIndicator.setupActivityIndicator(in: self.view)
        activityIndicator.showActivityIndicator()
        subscribeTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = competitionInfoViewModel.competition.name
        competitionInfoViewModel.getData()
    }
    //SettingUp ViewModel Closure
    func settingUpVM(){
        //Setting the navigation
        competitionInfoViewModel.navigateForward = {match in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MatchInfoTableViewController") as! MatchInfoTableViewController
            vc.matchInfoViewModel = MatchInfoViewModel(match: match)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        //Setting up No-result
        competitionInfoViewModel.noResult = {str in
            self.presentAlert(title: "Error", message: str, buttonTitle: "Ok")
            self.activityIndicator.hideActivityIndicator()
        }
        // hide TableView Closure
        self.competitionInfoViewModel.hideTableView = {flag in
            self.matchesTableView.isHidden = flag
            self.activityIndicator.hideActivityIndicator()
        }

    }
    //Putting Values to Competition Section
    func settingUpVC(){
        competitionTypeLbl.text = competitionInfoViewModel.competition.type
        competitionNameLbl.text = competitionInfoViewModel.competition.name
        competitionCodeLbl.text = competitionInfoViewModel.competition.code
        var url = URL(string: competitionInfoViewModel.competition.emblem ?? "")
        if let url = url {
            competitionImgView.kf.setImage(with: url,options: [])
        }else{
            competitionImgView.image = UIImage(named: "FifaImg")
        }
        competitionInfoViewModel.noResult = {str in
            self.presentAlert(title: "Error", message: str, buttonTitle: "Ok")
        }
                
    }
    // Register nib file
    func addingNibFile(){
        let nib = UINib(nibName: "CompetitionInfoCell", bundle: nil)
        matchesTableView.register(nib, forCellReuseIdentifier: "CompetitionInfoCell")
        matchesTableView.rowHeight = self.view.bounds.height/6
    }
    // Subscribtion Publisher to TV
    func subscribeTableView(){
        competitionInfoViewModel.publishedObj.bind(to: matchesTableView.rx.items(cellIdentifier: "CompetitionInfoCell", cellType: CompetitionInfoCell.self)){row, item, cell in
            cell.viewModel = CompetitionInfoCellViewModel(match: self.competitionInfoViewModel.matchesArr[row])
            cell.putData()
            
        }.disposed(by: disposeBag)
        
        matchesTableView.rx.itemSelected.subscribe(onNext: { indexPath in
            self.competitionInfoViewModel.navigateForward(self.competitionInfoViewModel.matchesArr[indexPath.row])
        }).disposed(by: disposeBag)
    }
    
    
}
extension CompetitionInfoTableViewController{
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
