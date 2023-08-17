//
//  ProfileViewController.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit
import SwiftBaseArchitecture

protocol ProfileViewProtocol: AnyObject {
    func displayProfile(_ profile: Profile)
}

class ProfileViewController: BaseViewController, BindableView, ProfileViewProtocol {
    
    typealias Presenter = ProfilePresenterProtocol
    var presenter: Presenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VIPER"
        view.backgroundColor = .red
        presenter?.viewDidLoad()
    }
    
    func displayProfile(_ profile: Profile) {
        print("Profile received. \(profile)")
    }
    
    override func didTapPushButton(_ sender: UIButton) {
        presenter?.routeToMenu()
    }
}
