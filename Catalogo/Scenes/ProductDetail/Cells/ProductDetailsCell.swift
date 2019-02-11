//
//  ProductDetailsCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class ProductDetailsCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct!
    
    func setup(withDisplayedProduct displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct) {
        self.displayedProduct = displayedProduct
        showData()
        setThemes()
    }
    
    private func showData() {
        name.text = displayedProduct.name
        if let description = displayedProduct.description {
            descriptionLabel.text = description
        }
        if let finalPrice = displayedProduct.finalPrice, let currency = displayedProduct.currency{
            price.text = "\(String(finalPrice)) \(currency)"
        }
        
    }
    
    private func setThemes() {
        name.textColor = UIColor.black
        price.textColor = DefaultColors.greenColor
    }
}
