//
//  TeamCell.swift
//  FreeNba
//
//  Created by Mauro Olivo on 13/02/21.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblConference: UILabel!
    @IBOutlet weak var lblDivision: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ team: Team) {
        lblName.text = team.fullName ?? ""
        lblCity.text = team.city ?? ""
        lblConference.text = "Conference: \(team.conference ?? "")"
        lblDivision.text = "Division: \(team.division ?? "")"
    }

}
