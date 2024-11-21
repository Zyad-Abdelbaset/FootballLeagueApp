//
//  MatchInfoTableTableViewController.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 20/11/2024.
//

import UIKit

class MatchInfoTableViewController: UITableViewController {
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAwayHalfScore: UILabel!
    @IBOutlet weak var lblAwayFullScore: UILabel!
    @IBOutlet weak var lblRefreeNationality: UILabel!
    @IBOutlet weak var lblRefreeName: UILabel!
    @IBOutlet weak var lblHomeHalfScore: UILabel!
    @IBOutlet weak var lblHomeFullScore: UILabel!
    @IBOutlet weak var lblAreaCode: UILabel!
    @IBOutlet weak var lblArearName: UILabel!
    @IBOutlet weak var imgViewArea: UIImageView!
    @IBOutlet weak var lblShortAwayTeam: UILabel!
    @IBOutlet weak var lblAwayTeam: UILabel!
    @IBOutlet weak var lblShortHomeTeam: UILabel!
    @IBOutlet weak var lblHomeTeam: UILabel!
    @IBOutlet weak var imgViewAwayTeam: UIImageView!
    @IBOutlet weak var imgViewHomeTeam: UIImageView!
    var matchInfoViewModel:MatchInfoViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Match Info"
        putData()
    }
    
    
    func putData(){
        //match Status
        lblStatus.text = matchInfoViewModel.match.status
        //----------------
        var url = URL(string: matchInfoViewModel.match.homeTeam.crest ?? "")
        let flag = matchInfoViewModel.match.homeTeam.crest?.contains(".svg")
        if let url = url {
            imgViewHomeTeam.kf.setImage(with: url,options: flag! ? [.processor(SVGKitProcessor())] : [])
        }else{
            imgViewHomeTeam.image = UIImage(named: "FifaImg")
        }
        lblHomeTeam.text = matchInfoViewModel.match.homeTeam.name
        lblShortHomeTeam.text = matchInfoViewModel.match.homeTeam.tla
        //----------------
        url = URL(string: matchInfoViewModel.match.awayTeam.crest ?? "")
        let flag2 = matchInfoViewModel.match.awayTeam.crest?.contains(".svg")
        if let url = url {
            imgViewAwayTeam.kf.setImage(with: url,options: flag2! ? [.processor(SVGKitProcessor())] : [])
        }else{
            imgViewAwayTeam.image = UIImage(named: "FifaImg")
        }
        lblAwayTeam.text = matchInfoViewModel.match.awayTeam.name
        lblShortAwayTeam.text = matchInfoViewModel.match.awayTeam.tla
        //-----------------------------
        
        url = URL(string: matchInfoViewModel.match.area.flag ?? "")
        let flag3 = matchInfoViewModel.match.area.flag?.contains(".svg")
        if let url = url {
            imgViewArea.kf.setImage(with: url,options: flag3! ? [.processor(SVGKitProcessor())] : [])
        }else{
            imgViewArea.image = UIImage(named: "FifaImg")
        }
        imgViewArea.layer.cornerRadius = 10
        lblArearName.text = matchInfoViewModel.match.area.name
        lblAreaCode.text = matchInfoViewModel.match.area.code
        //-------------------------
        lblHomeFullScore.text = "\(matchInfoViewModel.match.score.fullTime.home ?? 0)"
        lblHomeHalfScore.text = "\(matchInfoViewModel.match.score.halfTime.home ?? 0)"
        lblAwayFullScore.text = "\(matchInfoViewModel.match.score.fullTime.away ?? 0)"
        lblAwayHalfScore.text = "\(matchInfoViewModel.match.score.halfTime.away ?? 0)"
        //-----------------------
        lblRefreeName.text = "Name: \(matchInfoViewModel.match.referees.first?.name ?? "Not Available")"
        lblRefreeNationality.text = "Nationality: \(matchInfoViewModel.match.referees.first?.nationality ?? "Not Available")"
        
    }
    

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 3
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 3
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
}
