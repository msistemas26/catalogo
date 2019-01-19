//
//  StoreListRouter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol StoreListRoutingLogic
{
    func showSelectedStore(withStoreIndex: Int)
}

protocol StoreListDataPassing
{
    var dataStore: StoreListDataStore? { get set }
}

class StoreListRouter: NSObject, StoreListRoutingLogic, StoreListDataPassing
{
    weak var viewController: StoreListViewController?
    var dataStore: StoreListDataStore?
    
    // MARK: Routing
    
    func showSelectedStore(withStoreIndex: Int)
    {
        
        if let alertMessage = StoreViewListViewController.fromXib(), let selectedStore = dataStore?.fetchedStores[withStoreIndex] {
            dataStore?.selectedStore = selectedStore
            alertMessage.setupData(withLanguajes: selectedStore.storeViews) { (store) in
                alertMessage.dismiss(animated: true, completion: nil)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "HomeListViewController") as! HomeListViewController
                var destinationDS = destinationVC.router!.dataStore!
                self.passDataToConversation(source: self.dataStore!, destination: &destinationDS)
                self.navigateToConversation(source: self.viewController!, destination: destinationVC)
            }
            viewController?.present(alertMessage, animated: true, completion: nil)
        }
    }
    
    // MARK: Navigation
    
    func navigateToConversation(source: StoreListViewController, destination: HomeListViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToConversation(source: StoreListDataStore, destination: inout HomeListDataStore)
    {
        //destination.value = ""
    }
}
