//
//  HomeListCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeListCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var displayedProduct: HomeList.FetchProducts.ViewModel.DisplayedProduct!
    
    func setup(withDisplayedProduct displayedProduct: HomeList.FetchProducts.ViewModel.DisplayedProduct) {
        self.displayedProduct = displayedProduct
        showData()
        setThemes()
    }
    
    private func showData() {
        name.text = displayedProduct.name
        if let finalPrice = displayedProduct.finalPrice {
            price.text = String(finalPrice)
        }
        
        let placeholderImage = UIImage(named: "defaultImage")!
        
        guard let imageUrl = displayedProduct.image, let url = URL(string: imageUrl) else {
            image.image = placeholderImage
            return
        }
        
        let imageFilter = AspectScaledToFillSizeFilter(size: image.frame.size)
        
        image.af_setImage(withURL: url, placeholderImage: placeholderImage, filter: imageFilter, progress: nil, imageTransition: .noTransition, runImageTransitionIfCached: false, completion: { (image) in
        })
    }
    
    private func setThemes() {
        name.textColor = UIColor.black
        price.textColor = UIColor.black
    }
}
