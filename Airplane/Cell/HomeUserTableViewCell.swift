//
//  HomeUserTableViewCell.swift
//  Airplane
//
//  Created by Carlos on 24/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit
import Kingfisher

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
            let age = user.dob?.age,
            let imageMedium = user.picture?.medium
            else { return }
        
        self.cellName.text = "\(index).\nName: \(name) \(surname)"
        self.cellGender.text = "Gender: \(gender)"
        self.cellAge.text = "Age: \(String(age))"
        
        /*
         let url = URL(string: imageMedium)
         let data = try? Data(contentsOf: url!)
         self.cellImage.image = UIImage(data: data!)
         */
        loadImage(imageNamed: imageMedium)
    }
    
    override func prepareForReuse() {
        self.cellImage.image = nil
        self.cellName.text = ""
        self.cellGender.text = ""
        self.cellAge.text = ""
    }
    
    func loadImage(imageNamed: String) {
        let url = URL(string: imageNamed)
        //let processor = DownsamplingImageProcessor(size: (cellImage?.bounds.size)!)
        //    |> RoundCornerImageProcessor(cornerRadius: 20)
        //let processor = DownsamplingImageProcessor(size: (cellImage?.bounds.size)!)
        let processor = RoundCornerImageProcessor(cornerRadius: 40)
        cellImage?.kf.indicatorType = .activity
        cellImage?.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
        ]) {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
    }
}
