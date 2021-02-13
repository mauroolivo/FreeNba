//
//  ViewController.swift
//  FreeNba
//
//  Created by Mauro Olivo on 12/02/21.
//

import UIKit
import PromiseKit

class TeamsViewController: UIViewController, Storyboardable {
    
    static var storyboardType: StoryboardType = .main
    var service = Service()
    weak var coordinator: MainCoordinator?
    var teams: [Team] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NBA Teams and Players"
        
        call()
    }
    
    func call() {
        
        service.execute(TeamsEndPoint())
            .done { [weak self] (result: ResponseTeams) in
                self?.teams = result.data ?? []
                self?.tableView.reloadData()
            }.catch {(error: Error) in
                print(error)
            }
        
    }
    
}

extension TeamsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell") as? TeamCell {
            cell.configure(teams[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.showPlayers()
    }
    
}
