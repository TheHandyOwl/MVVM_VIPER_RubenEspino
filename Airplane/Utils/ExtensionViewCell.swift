//
//  ExtensionViewCell.swift
//  Airplane
//
//  Created by Carlos on 24/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit
import MapKit
extension UITableViewCell {
    
    func configureShadow(view: UIView?, image: UIImageView?, map: MKMapView?, cornerRadius: CGFloat = 40) {
        
        view?.layer.cornerRadius = 8.0
        view?.layer.shadowColor = UIColor.gray.cgColor
        view?.layer.shadowOffset = CGSize.zero
        view?.layer.shadowOpacity = 0.6
        
        image?.layer.cornerRadius = cornerRadius
        image?.layer.borderColor = UIColor.systemBlue.cgColor
        image?.layer.borderWidth = 4
        
        map?.layer.cornerRadius = 8.0
        
    }
    
    func animationCell(view: UIView, duration: Double) {
        
        view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [], animations: {
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
    }
    
}
