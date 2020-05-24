//
//  ViewController.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol HomeView : class {
    
}

class HomeViewController: UIViewController {

    var presenter : HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController : HomeView {
    
}

