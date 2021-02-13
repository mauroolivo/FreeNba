import UIKit
import SwiftUI

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension MainCoordinator {
    
    func start() {
        let vc = TeamsViewController.instantiate()
        vc.coordinator = self
        push(vc)
    }

    func showPlayers() {
        let vc = PlayersViewController.instantiate()
        vc.coordinator = self
        push(vc)
    }
    
    func showPlayer() {
        let vc = PlayerViewController.instantiate()
        vc.coordinator = self
        push(vc)
    }
    
}


