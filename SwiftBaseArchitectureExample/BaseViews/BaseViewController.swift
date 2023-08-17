//
//  BaseViewController.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var navigationTitleSize: CGFloat = 36 {
        didSet {
            guard navigationTitleSize != oldValue else { return }
            setupNavBarAppearance()
        }
    }
    
    lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(didTapPushButton(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.backgroundColor = .blue.withAlphaComponent(0.75)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBarAppearance()
    }
    
    func setupConstraints() {
        view.addSubview(pushButton)
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushButton.heightAnchor.constraint(equalToConstant: 48),
            pushButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func didTapPushButton(_ sender: UIButton) { }
    
    func setupNavBarAppearance() {
        guard let navBar: UINavigationBar = navigationController?.navigationBar else {
            return
        }
        navBar.barStyle = .default
        navBar.prefersLargeTitles = true
        navBar.tintColor = .white
        
        let navigationTitleFont = UIFont.systemFont(
            ofSize: navigationTitleSize,
            weight: .bold
        )
        let navBarAppearance: UINavigationBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .black.withAlphaComponent(0.9)
        navBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: navigationTitleFont,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.font: navigationTitleFont,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navBar.standardAppearance = navBarAppearance
        navBar.scrollEdgeAppearance = navBarAppearance
    }
}
