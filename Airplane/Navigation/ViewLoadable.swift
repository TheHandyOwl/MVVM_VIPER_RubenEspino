//
//  ViewLoadable.swift
//  Airplane
//
//  Created by Carlos on 30/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

protocol ViewLoadable : AnyObject {
    static var nibName : String { get }
}

extension ViewLoadable {
    
    static func loadNibName() -> Self {
        return loadNibName(from: Bundle.init(for: self))
    }
    
    static func loadNibName(from bundle: Bundle) -> Self {
        return bundle.loadNibNamed(self.nibName, owner: nil, options: nil)?.first as! Self
    }
    
}
