//
//  PlayersViewController.swift
//  FreeNba
//
//  Created by Mauro Olivo on 13/02/21.
//

import UIKit
import PromiseKit

class PlayersViewController: UIViewController, Storyboardable {

    static var storyboardType: StoryboardType = .main
    var service = Service()
    weak var coordinator: MainCoordinator?
    var players: [Player] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Players"
        
        call()
    }
    
    func call() {

        service.execute(PlayersEndPoint())
            .done { [weak self] (result: ResponsePlayers) in
                self?.players = result.data ?? []
                self?.tableView.reloadData()
            }.catch {(error: Error) in
                print(error)
            }
        
    }
}

extension PlayersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    

    if let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as? PlayerCell {
        cell.configure(players[indexPath.row])
        return cell
    }
    
    return UITableViewCell()
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 120
  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let player = players[indexPath.row]
        
        guard let id = player.id else { return }
        coordinator?.showPlayer(id)
    }
  
}
