//
//  MainTabBarController.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import UIKit
import Combine

enum ArchitectureType {
    case mvvmDelegate
    case mvvmCombine
    case viper
    
    var baseViewController: UIViewController? {
        let viewFactory = ViewFactory()
        switch self {
        case .mvvmDelegate:
            return viewFactory.makeItemListViewController()
        case .mvvmCombine:
            return viewFactory.makeMenuViewController()
        case .viper:
            return viewFactory.makeProfileViewController()
        }
    }
}

class MainTabBarController: UITabBarController {
    
    private(set) var architectureType: ArchitectureType?
    
    init(_ architectureType: ArchitectureType) {
        self.architectureType = architectureType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        if let archType = architectureType {
            let navBarController = MainNavigationController(
                rootViewController: MainViewController(archType)
            )
            setViewControllers([navBarController], animated: true)
        }
        
        tabBar.tintColor = .white
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .black.withAlphaComponent(0.9)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
    }
}
