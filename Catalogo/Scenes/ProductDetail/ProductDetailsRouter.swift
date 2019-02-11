//
//  ProductDetailsRouter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ProductDetailsRoutingLogic
{
    func showSelectedProduct(withProductIndex: Int)
}

protocol ProductDetailsDataPassing
{
    var dataStore: ProductDetailsDataStore? { get set }
}

class ProductDetailsRouter: NSObject, ProductDetailsRoutingLogic, ProductDetailsDataPassing
{
    weak var viewController: ProductDetailsViewController?
    var dataStore: ProductDetailsDataStore?
    
    // MARK: Routing
    
    func showSelectedProduct(withProductIndex: Int)
    {
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToConversation(source: dataStore!, destination: &destinationDS)
        navigateToConversation(source: viewController!, destination: destinationVC)
         */
    }
    
    /*
    // MARK: Navigation
    
    func navigateToConversation(source: ProductDetailsViewController, destination: ViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToConversation(source: ProductDetailsDataStore, destination: inout DataStore)
    {
        destination.value = ""
    }
    */
}
