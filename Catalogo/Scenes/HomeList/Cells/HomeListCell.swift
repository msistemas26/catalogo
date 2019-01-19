//
//  HomeListCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class HomeListCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    var displayedProduct: HomeList.FetchProducts.ViewModel.DisplayedProduct!
    
    func setup(withDisplayedProduct displayedProduct: HomeList.FetchProducts.ViewModel.DisplayedProduct) {
        self.displayedProduct = displayedProduct
        showData()
        setThemes()
    }
    
    private func showData() {
        title.text = displayedProduct.description
    }
    
    private func setThemes() {
        title.textColor = UIColor.black
    }
}
