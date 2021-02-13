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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        call()
    }


    func call() {

//        service.execute(TeamsEndPoint())
//            .done { (result: ResponseTeams) in
//                print(result)
//            }.catch {(error: Error) in
//                print(error)
//            }
        
//        service.execute(PlayersEndPoint())
//            .done { (result: ResponsePlayers) in
//                print(result)
//            }.catch {(error: Error) in
//                print(error)
//            }
        
//        service.execute(PlayerEndPoint("3"))
//            .done { (result: Player) in
//                print(result)
//            }.catch {(error: Error) in
//                print(error)
//            }
        
    }
}
