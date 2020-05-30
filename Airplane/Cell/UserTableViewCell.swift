//
//  UserTableViewCell.swift
//  Airplane
//
//  Created by Carlos on 29/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
    static var estimatedHeight : CGFloat = 250.0
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureShadow(view: mView)
        mImage.layer.cornerRadius = 65
        mImage.layer.borderColor = UIColor.systemBlue.cgColor
        mImage.layer.borderWidth = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.mImage?.image = nil
        self.name.text = ""
        self.age.text = ""
    }
    
    func configureCell(user: UserResult) {
        guard let name = user.name?.first,
            let surname = user.name?.last,
            let age = user.dob?.age,
            let imageLarge = user.picture?.large
            else { return }
        
        self.name.text = "Name: \(name) \(surname)"
        self.age.text = "Age: \(String(age))"
        
        loadImage(imageNamed: imageLarge)
    }

    func loadImage(imageNamed: String) {
        let url = URL(string: imageNamed)
        //let processor = DownsamplingImageProcessor(size: (cellImage?.bounds.size)!)
        //    |> RoundCornerImageProcessor(cornerRadius: 20)
        //let processor = DownsamplingImageProcessor(size: (cellImage?.bounds.size)!)
        let processor = RoundCornerImageProcessor(cornerRadius: 65)
        self.mImage?.kf.indicatorType = .activity
        self.mImage?.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
        ]) {
            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//                return
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
        }
        
    }
    
}
