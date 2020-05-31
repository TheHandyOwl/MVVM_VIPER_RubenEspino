//
//  DetailViewController.swift
//  Airplane
//
//  Created by Carlos on 25/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

enum UserDetailCell {
    case contact
    case map
    case user
}

protocol DetailView : class {
    func update(dato: UserResult)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : DetailPresenter?
    var userData : UserResult?
    
    private let mCellTypes = [UserDetailCell.user, UserDetailCell.contact, UserDetailCell.map]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User: \(userData?.name?.first ?? "No name available")")
        
        configureNavBar()
        configureTableView()
    }
    
    func configureNavBar() {
        //Normal
        let font = UIFont.systemFont(ofSize: 30)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font : font,
            .foregroundColor : UIColor.white,
            .shadow : shadow
        ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Airplane", style: .plain, target: self, action: #selector(backToMainView))
        navigationItem.leftBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
    }
    
    @objc func backToMainView() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailViewController : DetailView {
    
    func update(dato: UserResult) {
        userData = dato
    }
    
}

extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch mCellTypes[indexPath.row] {
        case .contact:
            return ContactTableViewCell.estimatedHeight
        case .map:
            return MapTableViewCell.estimatedHeight
        case .user:
            return UserTableViewCell.estimatedHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mCellTypes[indexPath.row] {
        case .contact:
            return cellContact(tableView, cellForRowAt: indexPath)
        case .map:
            return cellMap(tableView, cellForRowAt: indexPath)
        case .user:
            return cellUser(tableView, cellForRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func cellContact(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ContactTableViewCell {
        let cellID = "ContactTableViewCell"
        let cell = initCell(tableView, indexPath: indexPath, cellID: cellID) as! ContactTableViewCell
        if let user = userData {
            cell.configureCell(user: user)
        }
        return cell
    }
    
    private func cellMap(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MapTableViewCell {
        let cellID = "MapTableViewCell"
        let cell = initCell(tableView, indexPath: indexPath, cellID: cellID) as! MapTableViewCell
        if let user = userData {
            cell.configureCell(user: user)
        }
        return cell
    }
    
    private func cellUser(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UserTableViewCell {
        let cellID = "UserTableViewCell"
        let cell = initCell(tableView, indexPath: indexPath, cellID: cellID) as! UserTableViewCell
        if let user = userData {
            cell.configureCell(user: user)
        }
        return cell
    }
    
    private func initCell(_ tableView: UITableView, indexPath: IndexPath, cellID: String) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if cell == nil {
            cell = UITableView().dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        }
        return cell
    }
    
}

extension DetailViewController : UITableViewDelegate {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        var cellID = ""
        cellID = "ContactTableViewCell"
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        cellID = "MapTableViewCell"
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        cellID = "UserTableViewCell"
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
}
