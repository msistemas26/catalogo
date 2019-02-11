//
//  ProductDetailsViewController.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ProductDetailsDisplayLogic: class
{
    func displayProducts(viewModel: ProductDetails.FetchProducts.ViewModel)
}

class ProductDetailsViewController: UIViewController, ProductDetailsDisplayLogic
{
    var interactor: ProductDetailsBusinessLogic?
    var router: (NSObjectProtocol & ProductDetailsRoutingLogic & ProductDetailsDataPassing)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var displayedProduct: ProductDetails.FetchProducts.ViewModel.DisplayedProduct!
    
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
        let interactor = ProductDetailsInteractor()
        let presenter = ProductDetailsPresenter()
        let router = ProductDetailsRouter()
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
        interactor?.fetchProduct()
    }
    
    func displayProducts(viewModel: ProductDetails.FetchProducts.ViewModel)
    {
        displayedProduct = viewModel.displayedProduct
        collectionView.reloadData()
    }
}


// MARK: - UICollectionView Delegates implementation
extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UINib(nibName: String(describing: ImageCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ImageCell.self))
        collectionView?.register(UINib(nibName: String(describing: ProductDetailsCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ProductDetailsCell.self))
        collectionView?.register(UINib(nibName: String(describing: AttributesCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: AttributesCell.self))
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        switch indexPath.section {
        case 0:
            guard let cell_ = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCell.self), for: indexPath) as? ImageCell else { return UICollectionViewCell() }
            cell_.setup(withDisplayedProduct: displayedProduct)
            return cell_
        case 1:
            guard let cell_ = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductDetailsCell.self), for: indexPath) as? ProductDetailsCell else { return UICollectionViewCell() }
            cell_.setup(withDisplayedProduct: displayedProduct)
            return cell_
        case 2:
            guard let cell_ = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AttributesCell.self), for: indexPath) as? AttributesCell else { return UICollectionViewCell() }
            cell_.setup(withDisplayedProduct: displayedProduct)
            return cell_
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let witdh = collectionView.frame.width
        switch indexPath.section {
        case 0:
            return CGSize(width: witdh, height: 300)
        case 1:
            return CGSize(width: witdh, height: 200)
        case 2:
            return CGSize(width: witdh, height: 200)
        default:
            return CGSize(width: witdh, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

