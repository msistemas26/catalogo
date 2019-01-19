//
//  StoreListViewController.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol StoreListDisplayLogic: class
{
    func displayStores(viewModel: StoreList.FetchStores.ViewModel)
}

class StoreListViewController: UIViewController, StoreListDisplayLogic
{
    var interactor: StoreListBusinessLogic?
    var router: (NSObjectProtocol & StoreListRoutingLogic & StoreListDataPassing)?
    @IBOutlet weak var tableView: UITableView!
    var displayedStores: [StoreList.FetchStores.ViewModel.DisplayedStore] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = StoreListInteractor()
        let presenter = StoreListPresenter()
        let router = StoreListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchStores()
        setUpTableView()
    }
    
    // MARK: Methods
    
    func fetchStores()
    {
        let request = StoreList.FetchStores.Request()
        interactor?.fetchStores(request: request)
    }
    
    func displayStores(viewModel: StoreList.FetchStores.ViewModel)
    {
        displayedStores = viewModel.displayedStores
        tableView.reloadData()
    }
}


// MARK: - UItableView Delegates implementation
extension StoreListViewController: UITableViewDelegate, UITableViewDataSource
{
    func setUpTableView() {
        tableView.register(UINib(nibName: String(describing: StoreListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: StoreListCell.self))
        tableView.estimatedRowHeight = 70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return displayedStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let displayedStore = displayedStores[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoreListCell.self), for: indexPath) as? StoreListCell else { return UITableViewCell() }
        
        cell.setup(withDisplayedStore: displayedStore)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showSelectedStore(withStoreIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = StoreListViewHeader()
        headerView.setup(withTitle: "STORES")
        return headerView
    }
}

