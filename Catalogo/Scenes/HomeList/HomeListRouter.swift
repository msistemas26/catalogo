//
//  HomeListRouter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol HomeListRoutingLogic
{
    func showSelectedProduct(withProductIndex: Int)
}

protocol HomeListDataPassing
{
    var dataStore: HomeListDataStore? { get set }
}

class HomeListRouter: NSObject, HomeListRoutingLogic, HomeListDataPassing
{
    weak var viewController: HomeListViewController?
    var dataStore: HomeListDataStore?
    
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
    
    func navigateToConversation(source: HomeListViewController, destination: ViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToConversation(source: HomeListDataStore, destination: inout DataStore)
    {
        destination.value = ""
    }
    */
}
