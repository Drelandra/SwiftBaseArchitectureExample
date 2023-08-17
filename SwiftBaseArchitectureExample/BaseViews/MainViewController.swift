//
//  MainViewController.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit

class MainViewController: BaseViewController {
    
    private(set) var architectureType: ArchitectureType?
    
    init(_ architectureType: ArchitectureType) {
        self.architectureType = architectureType
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome!"
        tabBarItem.title = "Home"
        view.backgroundColor = .white
    }
    
    override func didTapPushButton(_ sender: UIButton) {
        guard let baseVC = architectureType?.baseViewController else { return }
        self.navigationController?.pushViewController(baseVC, animated: true)
    }
}
