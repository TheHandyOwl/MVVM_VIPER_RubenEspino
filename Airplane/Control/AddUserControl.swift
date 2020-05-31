//
//  AddUserControl.swift
//  Airplane
//
//  Created by Carlos on 30/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

typealias UserClosure = (Int) -> ()

class AddUserControl: UIControl, ViewLoadable {
    
    static var nibName = "AddUserControl"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    var userClosure : UserClosure?
    
    var viewModel : AddUserViewModel! {
        didSet {
            let isHidden = viewModel.showStepper
            addButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
        }
    }
    
    @IBAction func addUserButton(_ sender: Any) {
        self.viewModel = self.viewModel.onAddUser()
        self.userClosure?(self.viewModel.stepValue)
    }
    
    @IBAction func incrementUserButton(_ sender: Any) {
        self.viewModel = self.viewModel.onIncrement()
        self.userClosure?(self.viewModel.stepValue)
    }
    
    @IBAction func decrementUserButton(_ sender: Any) {
        self.viewModel = self.viewModel.onDecrement()
        self.userClosure?(self.viewModel.stepValue)
    }
    
    func configure(usingViewModel viewModel: AddUserViewModel, userClosure: @escaping UserClosure) {
        self.viewModel = viewModel
        self.addButton.setTitle(viewModel.title, for: .normal)
        self.userClosure = userClosure
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

struct AddUserViewModel {
    let title : String
    let stepValue : Int
    let showStepper : Bool
    
    init(title: String, stepValue : Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddUserViewModel {
    
    func onAddUser() -> AddUserViewModel {
        return AddUserViewModel(title: self.title, stepValue: 1)
    }
    
    func onIncrement() -> AddUserViewModel {
        guard stepValue < 15 else { return self }
        return AddUserViewModel(title: self.title, stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> AddUserViewModel {
        guard stepValue > 0 else { return self }
        return AddUserViewModel(title: self.title, stepValue: self.stepValue - 1)
    }
    
}
