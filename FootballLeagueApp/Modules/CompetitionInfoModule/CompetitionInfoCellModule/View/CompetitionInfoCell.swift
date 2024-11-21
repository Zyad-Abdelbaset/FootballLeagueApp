//
//  CompetitionInfoCell.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 20/11/2024.
//

import UIKit
import Kingfisher
class CompetitionInfoCell: UITableViewCell {

    @IBOutlet weak var awayShortNameLbl: UILabel!
    @IBOutlet weak var awayNameLbl: UILabel!
    @IBOutlet weak var awayImgView: UIImageView!
    @IBOutlet weak var homeImgView: UIImageView!
    @IBOutlet weak var homeShortNameLbl: UILabel!
    @IBOutlet weak var homeNameLbl: UILabel!
    @IBOutlet weak var stageLbl: UILabel!
    var viewModel:CompetitionInfoCellViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        //Cell View
        contentView.layer.borderWidth = 0
        contentView.backgroundColor = .lightGray

        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 8.0 
        contentView.layer.masksToBounds = true
    }
    func putData(){
        
        stageLbl.text = viewModel.match.status
        homeNameLbl.text = viewModel.match.homeTeam.name
        homeShortNameLbl.text = viewModel.match.homeTeam.tla
        awayNameLbl.text = viewModel.match.awayTeam.name
        awayShortNameLbl.text = viewModel.match.awayTeam.tla
        var url = URL(string: viewModel.match.homeTeam.crest ?? "")
        let flag = viewModel.match.homeTeam.crest?.contains(".svg")
        if let url = url {
            homeImgView.kf.setImage(with: url,options: flag! ? [.processor(SVGKitProcessor())] : [])
        }else{
            homeImgView.image = UIImage(named: "FifaImg")
        }
        url = URL(string: viewModel.match.awayTeam.crest ?? "")
        let flag2 = viewModel.match.awayTeam.crest?.contains(".svg")
        if let url = url {
            awayImgView.kf.setImage(with: url,options: flag2! ? [.processor(SVGKitProcessor())] : [])
        }else{
            awayImgView.image = UIImage(named: "FifaImg")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
