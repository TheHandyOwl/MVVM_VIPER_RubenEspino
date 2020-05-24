//
//  DetailViewController.swift
//  Airplane
//
//  Created by Carlos on 25/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var userData : UserResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User: \(userData?.name?.first ?? "No name available")")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
