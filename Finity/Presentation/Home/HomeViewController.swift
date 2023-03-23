//
//  HomeViewController.swift
//  Finity
//
//  Created by michelidze'smacbook on 25.02.23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BudgetingCell", bundle: nil), forCellReuseIdentifier: "BudgetingCell")
        tableView.register(UINib(nibName: "BudgetCell", bundle: nil), forCellReuseIdentifier: "BudgetCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetingCell", for: indexPath) as! BudgetingCell
//        return cell
        
        if indexPath.row == 0 {
                // Set the first cell to a random movie
            let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetingCell", for: indexPath) as! BudgetingCell
            return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetCell", for: indexPath) as! BudgetCell
                return cell
            }
    }

}
