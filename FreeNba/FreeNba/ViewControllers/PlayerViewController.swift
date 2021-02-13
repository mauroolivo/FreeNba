//
//  PlayerViewController.swift
//  FreeNba
//
//  Created by Mauro Olivo on 13/02/21.
//

import UIKit
import PromiseKit

class PlayerViewController: UIViewController, Storyboardable {

    static var storyboardType: StoryboardType = .main
    var service = Service()
    weak var coordinator: MainCoordinator?
    var playerId: Int?
    var player: Player?
    
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblLast: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblTeam: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        call()
    }


    func call() {

        guard let id = playerId else { return }
        
        service.execute(PlayerEndPoint(id))
            .done { [weak self] (result: Player) in
                self?.player = result
                self?.reload()
                print(result)
            }.catch {(error: Error) in
                print(error)
            }
        
    }
    
    func reload() {
        lblFirst.text = player?.firstName ?? ""
        lblLast.text = player?.lastName ?? ""
        lblPosition.text = "Position: \(player?.position ?? "")"
        lblTeam.text = "Team: \(player?.team?.fullName ?? "")"
        
    }
}
