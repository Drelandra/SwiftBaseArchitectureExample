//
//  ProfileRouter.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit
import SwiftBaseArchitecture

protocol ProfileRouting: Routing {
    func routeToMenu()
}

class ProfileRouter: ProfileRouting {
    
    weak var baseViewController: UIViewController?
    
    required init(baseViewController: UIViewController) {
        self.baseViewController = baseViewController
    }
    
    func routeToMenu() {
        let menuVC = MenuViewController()
        baseViewController?.navigationController?.pushViewController(menuVC, animated: true)
    }
}
