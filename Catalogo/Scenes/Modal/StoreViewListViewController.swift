//
//  StoreViewListViewController.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//


import UIKit

class StoreViewListViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dismissButton: UIButton!
    
    var completion: ((StoreView) -> Void)!
    var storeViews: [StoreView] = []
    
    static func fromXib() -> StoreViewListViewController? {
        // Register Nib
        let viewController = StoreViewListViewController(nibName: String(describing: StoreViewListViewController.self), bundle: nil)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
    }
    
    func setupData(withLanguajes data:[StoreView], completion: @escaping (StoreView) -> Void){
        self.completion = completion
        self.storeViews = data
        alertTitle.text = "StoreView"
        dismissButton.setTitle("DISMISS", for: .normal)
        dismissButton.backgroundColor = UIColor(red: 60/255, green: 179/255, blue: 113/255, alpha: 1.0)
        backViewShadow()
        dismissButtonShadow()
    }
    
    func backViewShadow(scale: Bool = true) {
        backView.layer.cornerRadius = 3.0
        backView.layer.shadowRadius = 3.0
        backView.layer.masksToBounds = false
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        backView.layer.shadowPath = UIBezierPath(rect: backView.bounds).cgPath
        backView.layer.shouldRasterize = true
        backView.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dismissButtonShadow(scale: Bool = true) {
        //dismissButton.imageView?.layer.cornerRadius = 7.0
        dismissButton.layer.shadowRadius = 1
        dismissButton.layer.shadowColor = UIColor(red: 46/255, green: 139/255, blue: 87/255, alpha: 1.0).cgColor
        dismissButton.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        dismissButton.layer.shadowOpacity = 1
        dismissButton.layer.masksToBounds = false
        backView.layer.shadowPath = UIBezierPath(rect: backView.bounds).cgPath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UItableView Delegates implementation
extension StoreViewListViewController: UITableViewDelegate, UITableViewDataSource
{
    func setUpTableView() {
        tableView.register(UINib(nibName: String(describing: StoreViewLIstCell.self), bundle: nil), forCellReuseIdentifier: String(describing: StoreViewLIstCell.self))
        tableView.estimatedRowHeight = 70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return storeViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let displayedStoreView = storeViews[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoreViewLIstCell.self), for: indexPath) as? StoreViewLIstCell else { return UITableViewCell() }
        
        cell.setup(withDisplayedStoreView: displayedStoreView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayedStoreView = storeViews[indexPath.row]
        self.completion(displayedStoreView)
    }

}


