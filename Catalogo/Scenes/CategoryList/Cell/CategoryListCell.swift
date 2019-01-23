//
//  CategoryListCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class CategoryListCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    var displayedCategory: CategoryList.FetchCategories.ViewModel.DisplayedCategory!
    
    func setup(withDisplayedCategory displayedCategory: CategoryList.FetchCategories.ViewModel.DisplayedCategory) {
        self.displayedCategory = displayedCategory
        showData()
        setThemes()
    }
    
    private func showData() {
        title.text = displayedCategory.name
    }
    
    private func setThemes() {
        title.textColor = UIColor.black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
