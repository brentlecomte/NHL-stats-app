//
//  LiveFeedTableViewController.swift
//  NHL APP
//
//  Created by Brent Le Comte on 18/12/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation
import UIKit

class LiveFeedTableViewController: UITableViewController {
    weak var delegate: LiveFeedViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(LiveFeedTableViewCell.nib, forCellReuseIdentifier: LiveFeedTableViewCell.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liveFeed().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LiveFeedTableViewCell.reuseIdentifier, for: indexPath) as? LiveFeedTableViewCell else {return UITableViewCell()}

        let play = liveFeed()[indexPath.row]
        
        cell.configure(team: play.team, event: play.result, time: play.about)
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentDetailView(play: liveFeed()[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)

    }
}

private extension LiveFeedTableViewController {
    func liveFeed() -> [AllPlays] {
        guard let delegate = delegate else { return [] }
        
        return delegate.allPlays().reversed()
    }
    
    func presentDetailView(play: AllPlays) {
        let viewController = ViewControllerProvider.sharedInstance.liveFeedDetailViewController(play: play)
        
        viewController.title = "detail"
        
        present(viewController, animated: true, completion: nil)
    }
}

