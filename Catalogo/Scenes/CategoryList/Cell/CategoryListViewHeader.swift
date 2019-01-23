//
//  CategoryListViewHeader.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class CategoryListViewHeader: UIView {
    
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
        
        // This should go in a Palete file.
        self.backgroundColor = UIColor.init(red: 60.0/255.0, green: 179.0/255.0, blue: 113.0/255.0, alpha: 1.0)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Auto layout
        let horizontalConstraint = title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
}
