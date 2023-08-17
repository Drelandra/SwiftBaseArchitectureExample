//
//  Factory.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit
import SwiftBaseArchitecture

protocol MainViewFactory {
    func makeItemListViewController() -> UIViewController
    func makeMenuViewController() -> UIViewController
    func makeProfileViewController() -> UIViewController
}

class ViewFactory: MainViewFactory {
    
    func makeItemListViewController() -> UIViewController {
        let itemVC = ItemListViewController()
        let itemVM = ItemListViewModel()
        itemVC.bind(with: itemVM)
        return itemVC
    }
    
    func makeMenuViewController() -> UIViewController {
        let menuVC = MenuViewController()
        let menuVM = MenuViewModel()
        menuVC.bind(with: menuVM)
        return menuVC
    }
    
    func makeProfileViewController() -> UIViewController {
        let profileVC = ProfileViewController()
        let profilePresenter = ProfilePresenter()
        let profileRouter = ProfileRouter(baseViewController: profileVC)
        let profileInteractor = ProfileInteractor()
        profileVC.bind(with: profilePresenter)
        profilePresenter.bind(with: profileVC, interactor: profileInteractor, router: profileRouter)
        profileInteractor.bind(with: profilePresenter)
        return profileVC
    }
}
