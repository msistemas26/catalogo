//
//  StoreViewLIstCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class StoreViewLIstCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    var displayedStoreView: StoreView!
    
    func setup(withDisplayedStoreView displayedStoreView: StoreView) {
        self.displayedStoreView = displayedStoreView
        showData()
        setThemes()
    }
    
    private func showData() {
        title.text = displayedStoreView.name
    }
    
    private func setThemes() {
        title.textColor = UIColor.black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
