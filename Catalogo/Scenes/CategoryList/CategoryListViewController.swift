//
//  CategoryListViewController.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol CategoryListDisplayLogic: class
{
    func displayCategories(viewModel: CategoryList.FetchCategories.ViewModel)
}

class CategoryListViewController: UIViewController, CategoryListDisplayLogic
{
    var interactor: CategoryListBusinessLogic?
    var router: (NSObjectProtocol & CategoryListRoutingLogic & CategoryListDataPassing)?
    @IBOutlet weak var tableView: UITableView!
    var displayedCategories: [CategoryList.FetchCategories.ViewModel.DisplayedCategory] = []
    
    var completion: ((String) -> Void)!
    
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
        let interactor = CategoryListInteractor()
        let presenter = CategoryListPresenter()
        let router = CategoryListRouter()
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
        fetchCategories()
        setUpTableView()
    }
    
    // MARK: Methods
    
    func fetchCategories()
    {
        let request = CategoryList.FetchCategories.Request()
        interactor?.fetchCategories(request: request)
    }
    
    func displayCategories(viewModel: CategoryList.FetchCategories.ViewModel)
    {
        displayedCategories = viewModel.displayedCategories
        tableView.reloadData()
    }
    
    @IBAction func closeCategoryButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func selectedCategory(completion: @escaping (String) -> Void){
        self.completion = completion
    }
}


// MARK: - UItableView Delegates implementation
extension CategoryListViewController: UITableViewDelegate, UITableViewDataSource
{
    func setUpTableView() {
        tableView.register(UINib(nibName: String(describing: CategoryListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CategoryListCell.self))
        tableView.estimatedRowHeight = 70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return displayedCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let displayedCategory = displayedCategories[section]
        return displayedCategory.children.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let displayedCategory = displayedCategories[indexPath.section]
        let childrenCategory = displayedCategory.children[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryListCell.self), for: indexPath) as? CategoryListCell else { return UITableViewCell() }
        
        cell.setup(withDisplayedCategory: childrenCategory)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayedCategory = displayedCategories[indexPath.section]
        let childrenCategory = displayedCategory.children[indexPath.row]
        
        if let categotyId = childrenCategory.categoryId {
            completion(categotyId)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CategoryListViewHeader()
        let displayedCategory = displayedCategories[section]
        headerView.setup(withTitle: displayedCategory.name ?? "Category")
        return headerView
    }
    
}

// MARK: - Transition Delegates implementation

extension CategoryListViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeUpToBottomTransitionAnimation(isPresenting: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeUpToBottomTransitionAnimation(isPresenting: false)
    }
}

