//
//  ProductDetailsInteractor.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ProductDetailsBusinessLogic
{
    func fetchProduct()
}

protocol ProductDetailsDataStore
{
    var selectedProduct: Product? { get set }
}

class ProductDetailsInteractor: ProductDetailsBusinessLogic, ProductDetailsDataStore
{
    var presenter: ProductDetailsPresentationLogic?
    var worker: ProductDetailsWorker?
    var selectedProduct: Product?
    
    // MARK: Methods
    
    func fetchProduct()
    {
        if let selectedProduct_ = selectedProduct {
            let response = ProductDetails.FetchProducts.Response(fetchedProduct: selectedProduct_)
            self.presenter?.presentProducts(with: response)
        }
    }
}
