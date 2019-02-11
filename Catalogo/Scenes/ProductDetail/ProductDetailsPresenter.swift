//
//  ProductDetailsPresenter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ProductDetailsPresentationLogic
{
     func presentProducts(with product: ProductDetails.FetchProducts.Response)
}

class ProductDetailsPresenter: ProductDetailsPresentationLogic
{
     weak var viewController: ProductDetailsDisplayLogic?
  
     // MARK: Methods
  
     func presentProducts(with respon: ProductDetails.FetchProducts.Response)
     {
        let product = respon.fetchedProduct
        let displayedProduct = ProductDetails.FetchProducts.ViewModel.DisplayedProduct(name: product.name, image: product.images?.first, finalPrice: product.finalPrice, currency: product.currency, color: product.color, description: product.description, composition: product.composition, sizes: product.sizes)
        
        let viewModel = ProductDetails.FetchProducts.ViewModel(displayedProduct: displayedProduct)
        viewController?.displayProducts(viewModel: viewModel)
     }
}
