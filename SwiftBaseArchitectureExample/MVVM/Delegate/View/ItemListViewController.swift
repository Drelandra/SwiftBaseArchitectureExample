//
//  ItemListViewController.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit
import SwiftBaseArchitecture

protocol ItemListViewModelDelegate: AnyObject {
    func viewModelDidUpdateItems(_ items: [Item])
}

class ItemListViewController: BaseViewController, BindableDelegate, ItemListViewModelDelegate {
    typealias ViewModel = ItemListViewModel

    var viewModel: ViewModel?
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDidLoad()
    }
    
    func setupDidLoad() {
        title = "MVVM + Delegate Pattern"
        view.backgroundColor = .green
        navigationTitleSize = 28
        viewModel?.fetchItems()
    }
    
    override func didTapPushButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(ViewFactory().makeMenuViewController(), animated: true)
    }
    
    func viewModelDidUpdateItems(_ items: [Item]) {
        self.items = items
        print("Items received. \(items)")
    }
}
