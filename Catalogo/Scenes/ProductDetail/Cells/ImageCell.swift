//
//  ImageCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    var displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct!
    
    func setup(withDisplayedProduct displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct) {
        self.displayedProduct = displayedProduct
        showData()
    }
    
    private func showData() {
        let placeholderImage = UIImage(named: "defaultImage")!
        
        guard let imageUrl = displayedProduct.image, let url = URL(string: imageUrl) else {
            image.image = placeholderImage
            return
        }
        
        let imageFilter = AspectScaledToFillSizeFilter(size: image.frame.size)
        
        image.af_setImage(withURL: url, placeholderImage: placeholderImage, filter: imageFilter, progress: nil, imageTransition: .noTransition, runImageTransitionIfCached: false, completion: { (image) in
        })
    }

}

