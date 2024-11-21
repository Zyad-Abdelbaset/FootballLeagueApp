//
//  CompetitionCell.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import UIKit
import Kingfisher
class CompetitionCell: UITableViewCell {

    @IBOutlet weak var competitionImgView: UIImageView!
    @IBOutlet weak var currentMatchDayLbl: UILabel!
    @IBOutlet weak var numOfAvailableSeasonsLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var codeLbl: UILabel!
    var viewModel:CompetitionCellViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.frame = contentView.frame.insetBy(dx: 0, dy: 5)
    }
    override func layoutSubviews() {
        contentView.layer.borderWidth = 0
        
        // Add a border around the cell
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.black.cgColor // Set the border color
        contentView.layer.cornerRadius = 8.0
        contentView.layer.masksToBounds = true
    }
    func putData(){
        //ImageView
        let url = URL(string: viewModel.competition.emblem ?? "")
        let flag = viewModel.competition.emblem?.contains(".svg")
        
        if let url = url {
            competitionImgView.kf.setImage(with: url,options: flag! ? [.processor(SVGKitProcessor())] : [] )
        }else{
            competitionImgView.image = UIImage(named: "FifaImg")
        }
        //Label
        nameLbl.text = viewModel.competition.name
        codeLbl.text = viewModel.competition.code
        numOfAvailableSeasonsLbl.text! = "number of Available Season: \(viewModel.competition.numberOfAvailableSeasons)"
        
        currentMatchDayLbl.text! = "current match day: \(viewModel.competition.currentSeason?.currentMatchday ?? 0)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
