//
//  HomeListViewController.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol HomeListDisplayLogic: class
{
    func displayProducts(viewModel: HomeList.FetchProducts.ViewModel)
}

class HomeListViewController: UIViewController, HomeListDisplayLogic
{
    var interactor: HomeListBusinessLogic?
    var router: (NSObjectProtocol & HomeListRoutingLogic & HomeListDataPassing)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var displayedProducts: [HomeList.FetchProducts.ViewModel.DisplayedProduct] = []
    
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
        let interactor = HomeListInteractor()
        let presenter = HomeListPresenter()
        let router = HomeListRouter()
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
        fetchProducts()
        setupCollectionView()
    }
    
    // MARK: Methods
    
    func fetchProducts()
    {
        let request = HomeList.FetchProducts.Request()
        interactor?.fetchProducts(request: request)
    }
    
    func displayProducts(viewModel: HomeList.FetchProducts.ViewModel)
    {
        displayedProducts = viewModel.displayedProducts
        collectionView.reloadData()
    }
    
    @IBAction func didTapCategoryButton(_ sender: UIButton) {
        router?.routeToCategories()
    }
}


// MARK: - UICollectionView Delegates implementation
extension HomeListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UINib(nibName: String(describing: HomeListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: HomeListCell.self))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return displayedProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let displayedProduct = displayedProducts[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeListCell.self), for: indexPath) as? HomeListCell else { return UICollectionViewCell() }
        
        cell.setup(withDisplayedProduct: displayedProduct)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.selectProductWith(index: indexPath.row)
        router?.routeToDetails()
    }
}

