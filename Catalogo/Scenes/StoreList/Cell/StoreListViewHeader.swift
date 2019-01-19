//
//  StoreListViewHeader.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class StoreListViewHeader: UIView {
    
    let title: UILabel = {
        let text = UILabel()
        text.font = UIFont(name: "verdana", size: 18.0)
        text.textColor = UIColor.white
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setup(withTitle text: String) {
        addSubview(title)
        title.text = text
        
        self.backgroundColor = UIColor.init(red: 217.0/255.0, green: 217.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Auto layout
        let horizontalConstraint = title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
}
