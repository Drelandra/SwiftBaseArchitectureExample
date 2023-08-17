//
//  ItemListViewModel.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import SwiftBaseArchitecture

class ItemListViewModel: ViewModelDelegable {
    typealias Delegate = ItemListViewModelDelegate
    weak var delegate: Delegate?
    
    private var items: [Item] = []

    func fetchItems() {
        items = [
            Item(name: "Item 1", price: 10.0),
            Item(name: "Item 2", price: 20.0),
            Item(name: "Item 3", price: 30.0)
        ]
        delegate?.viewModelDidUpdateItems(items)
    }
}
