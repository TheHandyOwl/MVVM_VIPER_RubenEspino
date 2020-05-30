//
//  MapTableViewCell.swift
//  Airplane
//
//  Created by Carlos on 29/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    static var estimatedHeight : CGFloat = 400.0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureShadow(view: mView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(user: UserResult) {
        guard let latitude = user.location?.coordinates?.latitude,
            let longitude = user.location?.coordinates?.longitude,
            let state = user.location?.state,
            let city = user.location?.city,
            let name = user.name?.first
            else { return }
        
        if let lat = Double(latitude), let lon = Double(longitude) {
            let location = CLLocationCoordinate2DMake(lat, lon)
            loadMap(location: location, name: name, city: city, state: state)
        }
        
    }
    
    func loadMap(location: CLLocationCoordinate2D, name: String, city: String, state: String) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(name) is from: \(city.capitalized)"
        annotation.subtitle = "\(state.capitalized)"
        mapView.addAnnotation(annotation)
        
        let mapCamera = MKMapCamera(lookingAtCenter: location, fromDistance: 1000000, pitch: 65, heading: 0)
        mapView.setCamera(mapCamera, animated: true)
    }

}
