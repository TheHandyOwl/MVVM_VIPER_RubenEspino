//
//  ViewController.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol HomeView : class {
    func update(data: [UserResult])
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter : HomePresenter?
    var userData : [UserResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCell()
        self.presenter?.viewDidLoad()
    }

}

extension HomeViewController : HomeView {
    
    func update(data: [UserResult]) {
        userData = data
        tableView.reloadData()
        userData.forEach { (user) in
            if let userMail = user.email {
                print("Mail: \(userMail)")
            }
        }
    }
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.count
    }
    
}


extension HomeViewController : UITableViewDelegate {
    
    func configureCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeUserTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeUserTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = userData[indexPath.row]
        
        let cellID = "HomeUserTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HomeUserTableViewCell
        if cell == nil {
            cell = UITableView().dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HomeUserTableViewCell
        }
        
        cell.configureCell(user: model, index: indexPath.row + 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
