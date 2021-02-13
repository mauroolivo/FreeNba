//
//  PlayerCell.swift
//  FreeNba
//
//  Created by Mauro Olivo on 13/02/21.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblLast: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ player: Player) {
        lblFirst.text = player.firstName ?? ""
        lblLast.text = player.lastName ?? ""
        lblPosition.text = "Position: \(player.position ?? "")"
        lblTeam.text = "Team: \(player.team?.fullName ?? "")"
    }
}
