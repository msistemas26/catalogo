//
//  AttributesCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class AttributesCell: UICollectionViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var compositionLabel: UILabel!
    @IBOutlet weak var sizesLabel: UITextView!
    
    var displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct!
    
    func setup(withDisplayedProduct displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct) {
        self.displayedProduct = displayedProduct
        showData()
        setThemes()
    }
    
    private func showData() {
        if let color_ = displayedProduct.color {
            colorLabel.text = color_
        }
        
        if let composition_ = displayedProduct.composition {
            compositionLabel.text = composition_
        }
        var size_text = ""
        for size_ in displayedProduct.sizes {
            size_text = size_text + "(\(size_.name!)) "
        }
        sizesLabel.text = size_text
    }
    
    private func setThemes() {
        colorLabel.textColor = UIColor.black
        compositionLabel.textColor = DefaultColors.greenColor
    }
}
