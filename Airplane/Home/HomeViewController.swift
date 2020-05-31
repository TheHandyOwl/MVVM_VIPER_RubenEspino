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

    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : HomePresenter?
    var userData : [UserResult] = []

    lazy var addUserControl : AddUserControl = {
        let control = AddUserControl.loadNibName()
        control.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        control.backgroundColor = UIColor.systemGreen
        control.layer.shadowColor = UIColor.gray.cgColor
        control.layer.shadowOffset = CGSize.zero
        control.layer.cornerRadius = 8.0
        control.layer.shadowOpacity = 0.6
        
        let viewModel = AddUserViewModel(title: "Nuevos pasajeros", stepValue: 0)
        control.configure(usingViewModel: viewModel) { (stepValue) in
            print("PASOS: \(stepValue)")
            if stepValue > 0 {
                self.presenter?.passengers(number: stepValue)
                control.backgroundColor = UIColor.white
            } else {
                control.backgroundColor = UIColor.systemGreen
                self.userData.removeAll()
                self.tableView.reloadData()
            }
        }
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Airplane"
        configureTableView()
        self.presenter?.viewDidLoad()
        self.containerStackView.addArrangedSubview(addUserControl)
    }

}

extension HomeViewController : HomeView {
    
    func update(data: [UserResult]) {
        userData = data
        tableView.reloadData()
        /*
        userData.forEach { (user) in
            if let userMail = user.email {
                print("Mail: \(userMail)")
            }
        }
        */
    }
    
}

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.count
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
        presenter?.prepareForRouter(user: userData[indexPath.row])
    }
    
}

extension HomeViewController : UITableViewDelegate {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeUserTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeUserTableViewCell")
    }
        
}
