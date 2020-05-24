//
//  HomeUserTableViewCell.swift
//  Airplane
//
//  Created by Carlos on 24/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class HomeUserTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellGender: UILabel!
    @IBOutlet weak var cellAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureShadow(view: cellView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(user: UserResult, index: Int) {
        guard let name = user.name?.first,
            let surname = user.name?.last,
            let gender = user.gender,
            let age = user.dob?.age else { return }
        
        self.cellName.text = "\(index).\nName: \(name) \(surname)"
        self.cellGender.text = "Gender: \(gender)"
        self.cellAge.text = "Age: \(String(age))"
    }
    
    override func prepareForReuse() {
        self.cellImage.image = nil
        self.cellName.text = ""
        self.cellGender.text = ""
        self.cellAge.text = ""
    }
}
