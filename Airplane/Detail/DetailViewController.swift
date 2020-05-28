//
//  DetailViewController.swift
//  Airplane
//
//  Created by Carlos on 25/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var userData : UserResult?
    
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

extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 99
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "ContactTableViewCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if cell == nil {
            cell = UITableView().dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        }
        
        cell.textLabel?.text = userData?.email
         
        return cell
    }
    
}

extension DetailViewController : UITableViewDelegate {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellID = "ContactTableViewCell"
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
}
