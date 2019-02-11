//
//  StoreListCell.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class StoreListCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    var displayedStore: StoreList.FetchStores.ViewModel.DisplayedStore!
    
    func setup(withDisplayedStore displayedStore: StoreList.FetchStores.ViewModel.DisplayedStore) {
        self.displayedStore = displayedStore
        showData()
        setThemes()
    }
    
    private func showData() {
        title.text = displayedStore.name
    }
    
    private func setThemes() {
        title.textColor = UIColor.white
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
